class AddColumnUsername < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, after: :email
  end
end
