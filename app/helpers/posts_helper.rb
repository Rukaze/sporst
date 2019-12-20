module PostsHelper
  def save_history()
   if current_user.save!
   else current_user.update
   end
  end
end
