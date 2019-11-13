class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :kind
      t.text :title
      

      t.timestamps
    end
  end
end
