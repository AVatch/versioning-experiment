class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :likes

      t.timestamps
    end
  end
end
