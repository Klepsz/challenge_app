class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable
  validates :user_name, presence: true, uniqueness: true

  has_many :questions
  has_many :answers
  has_many :likes
  
  has_attached_file :avatar, styles: { thumb: "100x100>" }, default_url: "/images/users/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_size :photo, less_than: 5.megabytes
  validates_attachment_content_type :avatar, content_type: ['image/jpeg', 'image/png']

  def to_s
    email
  end
end
