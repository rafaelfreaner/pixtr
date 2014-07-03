class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :name
    	t.text :description
    	t.string :url
    	t.timestamps
    	t.references :gallery
    end

    # add_index :images, :gallery_id
  end
end
