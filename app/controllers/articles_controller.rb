require 'acts-as-taggable-on'
class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		# @article.tag_list.add(@actile.category)
		@article.tag_list.add(@article.tag)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	def show
		@article = Article.find(params[:id])
		# @article.tag_list.add('js')
		# @article.tagged_list.add('asics')
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		@article.tag_list.add(@article.tag)
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	def destroy
		@article = Article.find(params[:id])
		@category = @article.category
		@article.destroy

		redirect_to :action => @category
	end

	def coder
	    @articles = Article.where("category = 'coder'") 
	end
	def walker
	    @articles = Article.where("category = 'walker'") 
	end
	def thinker
	    @articles = Article.where("category = 'thinker'") 
	end

	private
		def article_params
			params.require(:article).permit(:title, :text, :category, :tag, :tag_list => [])
		end
end
