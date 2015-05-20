class Tag < ActiveRecord::Base
  attr_accessible :id, :name

  def self.create_tag_array(names)
  	tags = []
  	
  	names.each do |name|
  		tags.push(Tag.create_tag(name))
  	end

  	tags
  end

  def self.create_tag(name)
  	query = Tag.where(name: name) #if exists

  	if query.length > 0
  		query.first
  	else
		tag = Tag.create(name: name)
  		tag
  	end
  end
end
