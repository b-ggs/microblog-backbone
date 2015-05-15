class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def reset
  	Post.destroy_all
  	Comment.destroy_all
  	Tag.destroy_all
  	PostTag.destroy_all

  	redirect_to '/populate'
  end

  def populate
  	Post.create(id: 1, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 2, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 3, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 4, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 5, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 6, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 7, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 8, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 9, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 10, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 11, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 12, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 13, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 14, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 15, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	Post.create(id: 16, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')



  	Comment.create(postid: 1, author:'test', text:'This is a comment.')
  	Comment.create(postid: 3, author:'test', text:'This is a comment.')
  	Comment.create(postid: 3, author:'test', text:'This is a comment.')
  	Comment.create(postid: 5, author:'test', text:'This is a comment.')
  	Comment.create(postid: 5, author:'test', text:'This is a comment.')
  	Comment.create(postid: 7, author:'test', text:'This is a comment.')
  	Comment.create(postid: 7, author:'test', text:'This is a comment.')
  	Comment.create(postid: 9, author:'test', text:'This is a comment.')
  	Comment.create(postid: 9, author:'test', text:'This is a comment.')
  	Comment.create(postid: 9, author:'test', text:'This is a comment.')
  	Comment.create(postid: 11, author:'test', text:'This is a comment.')
  	Comment.create(postid: 11, author:'test', text:'This is a comment.')
  	Comment.create(postid: 11, author:'test', text:'This is a comment.')
  	Comment.create(postid: 11, author:'test', text:'This is a comment.')

  	Tag.create(id: 1, name: 'miscellaneous')
  	Tag.create(id: 2, name: 'technology')
  	Tag.create(id: 3, name: 'rails')
  	Tag.create(id: 4, name: 'hello')

  	PostTag.create(tagid:1, postid:1)
  	PostTag.create(tagid:2, postid:1)
  	PostTag.create(tagid:3, postid:1)
  	PostTag.create(tagid:4, postid:1)

  	PostTag.create(tagid:1, postid:2)

  	redirect_to '/'
  end
end
