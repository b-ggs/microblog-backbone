class TagController < ApplicationController
	def all
		@tags = Tag.all.to_a
		render :json => @tags
	end

	def one
		@tag = Tag.find(params[:id])
		render :json => @tag
	end

	def post
		@tags_raw = PostTag.where(postid:params[:postid])
		@tagids = []
		@tagnames = []

		@tags_raw.each do |tag|
			@tagids.push(tag.tagid)
		end 

		@tagids.each do |tagid|
			tag = Tag.find(tagid)
			@tagnames.push({ name: tag.name })
		end

		render :json => @tagnames
	end
end