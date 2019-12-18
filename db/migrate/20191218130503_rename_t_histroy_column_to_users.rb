class RenameTHistroyColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :f_histroy, :f_history
  end
end
