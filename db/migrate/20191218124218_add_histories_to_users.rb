class AddHistoriesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :f_histroy, :string
    add_column :users, :s_history, :string
    add_column :users, :t_history, :string
  end
end
