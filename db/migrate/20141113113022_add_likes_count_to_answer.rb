class AddLikesCountToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :likes_count, :integer, default: 0
  end
end
