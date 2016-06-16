class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def create
    p params
    article = Article.new(article_params)
    if article.save
      redirect_to articles_path
    end
  end

 private
  def article_params
    params.require(:article).permit(:title, :body, :author)
  end

end
