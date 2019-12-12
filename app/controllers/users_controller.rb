class UsersController < ApplicationController
  def user_page
    @user = User.find_by(id: params[:id])
  end
end
