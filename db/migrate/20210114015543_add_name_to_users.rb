class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :introduction, :text
    add_column :users, :image_id, :string
    add_column :users, :is_deleted, :boolean, default: false
  end
end
