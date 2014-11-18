class RenameColumnAcceptedInAnswer < ActiveRecord::Migration
  def change
    rename_column :answers, :accepted, :accepted_answer
  end
end
