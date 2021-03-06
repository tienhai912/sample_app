class FollowingsController < ApplicationController
  before_action :find_user, :logged_in_user, only: :index

  def index
    @title = t "following2"
    @users = user.following.paginate page: params[:page]
    render "users/show_follow"
  end

  private

  def find_user
    @user = User.find_by id: params[:user_id]
    return if user

    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end
end
