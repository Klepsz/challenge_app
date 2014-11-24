class AddSuperstarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :superstar, :boolean, default: false
  end
end
