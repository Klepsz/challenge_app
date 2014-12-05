class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable, :omniauthable
  validates :user_name, presence: true, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :likes

  has_attached_file :avatar, styles: { thumb: "100x100#" },
                    default_url: "/assets/missing.png",
                    url: "/assets/users/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, less_than: 1.megabytes

  after_save :add_superstar_badge

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.user_name = auth.info.nickname
      user.email = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end    
  end

  def to_s
    email
  end

  protected

  def add_superstar_badge
    if points >= 1000 && superstar == false
      self.superstar = true
      self.save
    elsif superstar == true && points < 1000
      self.superstar = false
      self.save
    end
  end
end
