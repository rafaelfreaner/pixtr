class CreateGalleryLikes < ActiveRecord::Migration
  def change
    create_table :gallery_likes do |t|
      t.integer :gallery_id

      t.timestamps
    end
  end
end
