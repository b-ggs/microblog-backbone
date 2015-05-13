class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id
      t.string :author
      t.string :title
      t.text :preview
      t.text :text

      t.timestamps
    end
  end
end
