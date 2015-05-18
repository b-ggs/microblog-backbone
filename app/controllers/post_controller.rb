# stuff = @thing.children.all(
#   :joins => :other,
#   :conditions => {:others => {:another_id => some_id}},
#   :limit => my_limit,
#   :offset => my_offset,
# )

class PostController < ApplicationController
	def all
		@posts = Post.all(
			#:limit => 5,
			).to_a
		render :json => @posts
	end

	def tag
		@posts = []
		tag = params[:tag] # => "miscellaneous"
		
		# get tagid
		tagid = Tag.where(name: tag)

		#get postids with tagid
		postids = PostTag.where(tagid: tagid)

		postids.each do |postid|
			@posts.push(Post.find(postid.postid))
		end 
		
		render :json => @posts
	end

	def one
		@post = Post.find(params[:id])
		render :json => @post
	end
end
