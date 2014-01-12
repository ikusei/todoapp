class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, except: [:index,:destroy]
  accepts_nested_attributes_for :todos, allow_destroy: true
  
 private

  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end