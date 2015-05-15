# stuff = @thing.children.all(
#   :joins => :other,
#   :conditions => {:others => {:another_id => some_id}},
#   :limit => my_limit,
#   :offset => my_offset,
# )

class PostController < ApplicationController
	def all
		@posts = Post.all(
			:limit => 5,
			).to_a
		render :json => @posts
	end

	def one
		@post = Post.find(params[:id])
		render :json => @post
	end

	def tag
		
	end
end
