class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  
  def index
    @articles = Article.paginate(page: params[:page])
  end

  def new 
    @article = Article.new
  end 

  def show
    @article = Article.find(params[:id]) 
  end

  def test
  end

  def create

    @article = Article.new(article_params.merge(user_id: current_user.id))

    if @article.save
      redirect_to @article
      # redirect_to article_path(@article.id)
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to '/articles'
  end

  
  private

  def article_params
    params.require(:article).permit(:title, :body, :image_link, :tag)
  end     

end
