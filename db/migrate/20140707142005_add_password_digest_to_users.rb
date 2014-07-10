class AddPasswordDigestToUsers < ActiveRecord::Migration #ADD is to add columns to a table and it must end with TO something
  def change
    add_column :users, :password_digest, :string
  end
end
