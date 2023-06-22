class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find_by(id:params[:id])
            if @article.nil?
            render :file => "#{Rails.root}/public/404.html",  layout: false
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to root_path
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    private
    def article_params
      params.require(:article).permit(:title, :body, )
    end
end
