class ArticlesController < ApplicationController
  before_action :require_login, except: %i[index show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article `#{@article.title}` was created! Congratulations!"

    redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article `#{@article.title}` was updated! Congratulations!"

    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    flash.notice = "Article `#{@article.title}` was deleted! You will never see it again!"
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end
end
