class Comment < ActiveRecord::Base
  attr_accessible :author, :id, :postid, :text
end
