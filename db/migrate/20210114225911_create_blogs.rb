class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :genre_id
      t.string :title
      t.text :body
      t.string :image_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
