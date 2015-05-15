class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.integer :id
      t.integer :tagid
      t.integer :postid

      t.timestamps
    end
  end
end
