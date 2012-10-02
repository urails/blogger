class ArticlesController < ApplicationController
  #before_filter :require_login, :except => [:index, :show]

  respond_to :html, :json
  
  def index
    @articles = Article.all

    respond_with @articles
  end

  def show
    @article = Article.find(params[:id])

    respond_with @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])

    @article.save

    respond_with @article
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy

    respond_with @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    flash[:message] = "Article '#{@article.title}' Updated!"

    respond_with @article
  end
end
