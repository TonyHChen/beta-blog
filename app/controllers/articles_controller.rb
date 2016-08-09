class ArticlesController < ApplicationController
	
	#calls the set_article method for the edit, update, show, and destroy functions (saves having to write one line of code 4 times!)
	before_action :set_article, only: [:edit, :update, :show, :destroy]

	#for the /articles link, will be used to show all articles
	def index
		#grabs all articles from the database
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create

		#display what is being fed in for our reference
		#render plain: params[:article].inspect

		@article = Article.new(article_params)

		#here's code that usually used in create - uses if to save the article 
		if @article.save
			#flash message will appear in application.html.erb file in views/layouts, see that file for flash
			flash[:success] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			#if validation doesn't work, this runs - error!
			render 'new'
		end

	end

	def update
		#article update similar to article save, but article.update takes an argument to whitelist
		if @article.update(article_params)
			flash[:success] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	#show action - shows a specific article based on the id of the article
	def show
	end

	def destroy
		@article.destroy

		flash[:danger] = "Article was successfully deleted"
		redirect_to articles_path
	end

	private

		def set_article
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title, :description)
		end

end