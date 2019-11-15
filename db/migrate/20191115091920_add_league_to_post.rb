class AddLeagueToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :league, :string
  end
end
