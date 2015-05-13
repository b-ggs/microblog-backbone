class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id
      t.integer :postid
      t.string :author
      t.text :text

      t.timestamps
    end
  end
end
