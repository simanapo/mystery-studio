class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :remarks
      t.string :question_text
      t.string :answer_text
      t.string :answer
      t.string :question_image
      t.string :answer_image
      t.integer :challenge_level, null: false, default: 1
      t.integer :display_order

      t.datetime :created_at, null: false
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
