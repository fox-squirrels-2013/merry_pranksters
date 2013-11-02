class AddPasswordHashToMember < ActiveRecord::Migration
  def change
    add_column :members, :password_hash, :string
    remove_column :members, :password
  end
end
