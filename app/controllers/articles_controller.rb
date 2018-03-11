class ArticlesController < ApplicationController

  http_basic_authenticate_with name: 'user', password: 'password',
                               except: %i[index show]

  def new
    article
  end

  def edit
    article
  end

  def show
    article
  end

  def index
    @articles = Article.all
  end

  def create
    if article.save
      redirect_to article
    else
      render 'new'
    end
  end

  def update
    if article.update(article_params)
      redirect_to article
    else
      render 'edit'
    end
  end

  def destroy
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params 
    params.require(:article).permit(:title, :text)
  end

  def article
    calling_method = caller(1..1).first[/`.*'/][1..-2]
    @article = if calling_method == 'new'
                 Article.new
               elsif calling_method == 'create'
                 Article.new(article_params)
               elsif calling_method == 'edit' || 'show'
                 Article.find(params[:id])
               end
  end

end