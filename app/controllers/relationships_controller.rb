class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    return unless create_follow
    respond
  end

  def destroy
    return unless destroy_unfollow
    respond
  end

  private
  def create_follow
    @user = User.find_by id: params[:followed_id]
    if user
      current_user.follow user
    else
      flash[:danger] = t "user_not_found"
      redirect_to root_path
    end
  end

  def destroy_unfollow
    @user = Relationship.find_by(id: params[:id]).followed
    if user
      current_user.unfollow user
    else
      flash[:danger] = t "user_not_found"
      redirect_to root_path
    end
  end

  def respond
    respond_to do |format|
      format.html{redirect_to user}
      format.js
    end
  end
end
