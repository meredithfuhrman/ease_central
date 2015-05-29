class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :post_id
      t.string :title
      t.string :link
      t.string :thumbnail
      t.string :num_comments
      t.integer :user_id

      t.timestamps
    end
  end
end
