class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.references :post, foreign_key: true
      t.string :hint, limit: 2000
      t.datetime :created_at, null: false
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
