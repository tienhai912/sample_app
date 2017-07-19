class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create, :show]
  before_action :find_user, except: [:index, :new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    user = @user = User.new user_params
    if user.save
      user.send_activation_email
      flash[:info] = t "please_check_your_email"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @microposts = user.microposts.desc_order.paginate page: params[:page]
    active_relationship = current_user.active_relationships
    @build = active_relationship.build
    @destroy = active_relationship.find_by followed_id: user.id
  end

  def edit; end

  def update
    if user.update_attributes user_params
      flash[:success] = t "profile_updated"
      redirect_to user
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    flash[:success] = t "user_deleted"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def correct_user
    redirect_to root_url unless user.current_user? current_user
  end

  def find_user
    user = @user = User.find_by id: params[:id]
    return if user
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
