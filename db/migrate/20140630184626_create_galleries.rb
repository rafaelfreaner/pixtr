class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.string :name
    	t.text :description
    	t.timestamps #automatically creates created_at and updated_at columns
    end
  end
end
