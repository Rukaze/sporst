class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports do |t|
      t.string :kind
      t.string :league

      t.timestamps
    end
  end
end
