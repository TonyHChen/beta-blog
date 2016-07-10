class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create

		#display what is being fed in for our reference
		#render plain: params[:article].inspect

		@article = Article.new(article_params)
		@article.save
	end

	private
		def article_params
			params.require(:article).permit(:title, :description)
		end

end