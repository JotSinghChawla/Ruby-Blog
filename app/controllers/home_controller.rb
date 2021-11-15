class HomeController < ApplicationController
  def index
    @articles = Article.all.limit(4)
  end
  def contactus
  end
end
