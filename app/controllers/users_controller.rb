#encoding: utf-8
class UsersController < ApplicationController

  before_filter :signed_in_user,
                :only => [:edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy]

  before_filter {@title = "育儿达人" + @title_tail}

  def index
    @users = User.all
    @users_all_time = User.order("article_count desc").limit(3)
    @users_month = User.joins("right join articles on users.id = articles.user_id")
      .where("articles.created_at between ? and ?", Time.utc(2000), Time.utc(2020))
      .group("users.id, users.name, users.email").order("count(users.id) desc")
      .select("users.id, users.name, users.email, count(users.id) as article_qty")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to fishing tackle"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
