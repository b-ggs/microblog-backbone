class Post < ActiveRecord::Base
  attr_accessible :author, :id, :preview, :text, :title
end
