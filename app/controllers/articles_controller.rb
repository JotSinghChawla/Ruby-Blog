class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
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
    # render 'test'

    @article = Article.new(article_params)

    # @article.save
    if @article.save
      redirect_to @article
      # redirect_to article_path(@article.id)
    else

      puts "================================="
      puts "#{@article.errors.inspect}"

      render '/articles/new'
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
    params.require(:article).permit(:title, :body, :image_link)
  end     

end
