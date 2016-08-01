class Backend::ArticlesController < Backend::ApplicationController

  before_action :find_article, only: [:show, :destroy, :update]

  def create
    if Article.create(article_params)
      render status: 200
    else
      raise LogicError, "参数错误"
    end
  end

  def show
    response_json @article
  end

  def index
    response_json Article.all
  end

  def destroy
    if @article.destroy
      render status: 200
    else
      raise LogicError, "参数错误"
    end
  end

  def update
    if @article.update(article_params)
      render status: 200
    else
      raise LogicError, "参数错误"
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
