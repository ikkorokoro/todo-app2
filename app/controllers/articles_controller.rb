class ArticlesController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @articles = Article.all
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(params_article)
    if @article.save
      redirect_to root_path, notice: '保存できました'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(params_article)
      redirect_to root_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    if article.destroy!
      redirect_to root_path, notice: '削除されました'
    end
  end

  private

  def params_article
    params.require(:article).permit(:name, :description)
  end
end