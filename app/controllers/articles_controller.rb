class ArticlesController < ApplicationController
	
	#for the /articles link, will be used to show all articles
	def index
		#grabs all articles from the database
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create

		#display what is being fed in for our reference
		#render plain: params[:article].inspect

		@article = Article.new(article_params)

		#here's code that usually used in create - uses if to save the article 
		if @article.save
			#flash message will appear in application.html.erb file in views/layouts, see that file for flash
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			#if validation doesn't work, this runs - error!
			render 'new'
		end

	end

	def update
		@article = Article.find(params[:id])
		#article update similar to article save, but article.update takes an argument to whitelist
		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	#show action - shows a specific article based on the id of the article
	def show
		@article = Article.find(params[:id])
	end

	private
		def article_params
			params.require(:article).permit(:title, :description)
		end

end