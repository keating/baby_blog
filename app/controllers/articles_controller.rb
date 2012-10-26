#encoding: utf-8
class ArticlesController < ApplicationController

  before_filter :signed_in_user,
                :only => [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  before_filter {@title = "育儿经" + @title_tail}

  before_filter  do
    @hot_articles = Article.order("view_times desc").select("id, title").limit(10)
    @latest_articles = Article.all_by_created_time.select("id, title").limit(10)
  end

  def index
    if params[:content].to_s.strip.empty?
      @articles = Article.all_by_created_time
    else
      @articles = Article.where("title ilike '%#{params[:content]}%'")
    end
    render :index
  end

  def show
    @article = Article.find(params[:id])
    @article.update_attribute("view_times", @article.view_times.to_i + 1)
    @title = @article.title + @title_tail
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      # 更新用户文章数量后，需要重新登录一下用户
      @article.user.new_article
      sign_in @article.user
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.user.delete_article
    article.destroy
    redirect_to articles_path
  end

  private

  def correct_user
    @article = Article.find(params[:id])
    redirect_to(root_path) unless current_user?(@article.user)
  end

end
