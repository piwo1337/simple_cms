class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users_pages do |t|
      t.integer "user_id"
      t.integer "page_id"
    end
    add_index :admin_users_pages, ["user_id", "page_id"]
  end
end
