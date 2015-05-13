class CommentController < ApplicationController
	def all
		@comments = Comment.all.to_a
		render :json => @comments
	end

	def post
		@comments = Comment.where(postid:params[:postid])
		render :json => @comments
	end

	def one
		@comment = Comment.find(params[:id])
		render :json => @comment
	end
end
