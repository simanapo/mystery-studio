class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :remarks
      t.string :name
      t.string :image
      t.integer :challenge_level, null: false, default: 1

      t.timestamps
    end
  end
end
