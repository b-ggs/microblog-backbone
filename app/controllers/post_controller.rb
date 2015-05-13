class PostController < ApplicationController
	def all
		@posts = Post.all.to_a
		render :json => @posts
	end

	def one
		@post = Post.find(params[:id])
		render :json => @post
	end
end
