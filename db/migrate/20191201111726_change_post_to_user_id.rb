class ChangePostToUserId < ActiveRecord::Migration[5.2]
  def change
    if Rails.env.development? || Rails.env.test?
      change_column :posts, :user_id, :integer
    else Rails.env.production?
      # 本番環境はusingオプションを追加
      change_column :posts, :user_id, :integer , limit: 2
      #USING CAST(user_id AS integer)'
    end
  end
  
  
end
