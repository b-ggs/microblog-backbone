class Comment < ActiveRecord::Base
  attr_accessible :author, :id, :postid, :text

  def self.create_comment_array(data)
  	comments = []
  	
  	data.each do |comment|
  		comments.push(Comment.create_comment(comment[0], comment[1]))
  	end

  	comments
  end

  def self.create_comment(author, text)
  	comment = Comment.create(author: author, text: text)
  	comment
  end
end
