#encoding: utf-8
class PagesController < ApplicationController

  def home
    init_home_titles
    common_page
    logger.debug "+++++++++++++++++++++"
  end

  def search
    if params[:content]
      @articles = Article.where("title ilike '%#{params[:content]}%'")
    else
      common_page
    end
    init_search_titles
    render :home
  end

  private
    def common_page
      @articles = Article.all_by_created_time.limit(10)
    end

    def init_home_titles
      @articles_title = '博客文章'
    end

    def init_search_titles
      @articles_title = '搜索结果'
    end
end
