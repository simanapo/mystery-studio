class CreateAnswers< ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.string :answer, limit: 2000
      t.string :remarks, limit: 2000
      t.datetime :created_at, null: false
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
