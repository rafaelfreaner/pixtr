class MakeLikesPolymorphic < ActiveRecord::Migration

	class Like < ActiveRecord::Base
	end

	class ImageLike < ActiveRecord::Base
	end

	  def change
	  	add_column :likes, :content_type, :string
	  	add_column :likes, :content_id, :integer

		  	Like.all.each do |like|
		  	image_like = ImageLike.create!(image_id: like.image_id)
		  	like.update!(content_type: "ImageLike", content_id: like.id)
		  end

	  remove_column :likes, :image_id, :integer	  
	  end
 
end
