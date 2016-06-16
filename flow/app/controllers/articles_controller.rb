class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def new
    if request.xhr?
      render "_form.html.erb", layout:false
    end
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to articles_path
    end
  end


  def edit
    @article = Article.find(params[:id])
    p "8" * 80
  end

  def update
    p "%" * 80
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    article = Article.find(params[:id])
    comments = article.comments
    article.destroy
    comments.destroy
    redirect_to root_path
  end



 private
  def article_params
    params.require(:article).permit(:title, :body, :author)
  end

end
