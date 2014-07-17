class CreateGroupLikes < ActiveRecord::Migration
  def change
    create_table :group_likes do |t|
      t.integer :group_id

      t.timestamps
    end
  end
end
