class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, limit: 2000
      t.string :question_statement, limit: 1000
      t.string :remarks, limit: 2000
      t.datetime :created_at, null: false
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
