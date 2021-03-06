#All public methods must be placed before any private methods in .rb files

#Use 'http_basic_authenticate_with' method to add a basic HTTP authentication system

class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "chelsea", password: "password", except: [:index, :show]

	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
	end
	
	def new
		#Article object is passed back to the new template when it is rendered.
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			#Tells the browser to issue another request
			redirect_to @article
		else
			render 'new'
		end
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

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
