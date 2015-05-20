class Post < ActiveRecord::Base
  attr_accessible :author, :id, :preview, :text, :title

  def self.create_post(author, title, text, tags, comments)
  	preview = text[0..100] + "..."
  	post = Post.create(author: author, title: title, preview: preview, text: text)

  	tags.each do |tag|
  		PostTag.create(tagid: tag.id, postid: post.id)
  	end

  	comments.each do |comment|
      Comment.update(comment.id, postid: post.id)
  	end

  	post
  end
end
