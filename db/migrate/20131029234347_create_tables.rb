class CreateTables < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :password

      t.timestamps
    end

    create_table :feeds do |t|
      t.belongs_to :member

      t.timestamps
    end

    create_table :posts do |t|
      t.belongs_to :feed
      t.string :title
      t.string :content

      t.timestamps
    end


  end
end
