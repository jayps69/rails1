class ArticlesController < ApplicationController
  load_and_authorize_resource except: [:index, :show]  # Automatically loads and authorizes the resource for actions other than index
  before_action :authenticate_user!, except: [:index]  # Redirects to login for actions that require authentication (except index and show)
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end