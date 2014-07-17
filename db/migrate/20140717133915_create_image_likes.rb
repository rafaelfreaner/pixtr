class CreateImageLikes < ActiveRecord::Migration
  def change
    create_table :image_likes do |t|
      t.integer :image_id

      t.timestamps
    end
  end
end
