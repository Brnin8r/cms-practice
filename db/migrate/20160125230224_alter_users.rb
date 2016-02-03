class AlterUsers < ActiveRecord::Migration

  def up
  #This migration will change several things on the users table.
  #Rename users to admin_users
    rename_table("users", "admin_users")
  #add username column after email column
    add_column("admin_users", "username", :string, :limit => 25, 
      :after => "email")
  #Change email column to a different email
    change_column("admin_users", "email", :string, :limit => 100)
  #Rename password to hashed_password
    rename_column("admin_users", "password", "hashed_password")
  #add username as a new index for foreign keys
    puts "*** Adding an index is next ***"
    add_index("admin_users", "username")
  end

  def down
  #when dropped, reverse it all, changing, in the end, admin_users back to users
    remove_index("admin_users", "username")
    rename_column("admin_users", "hashed_password", "password")
    change_column("admin_users", "email", :string, :default => "", :null => false)
    remove_column("admin_users", "username")
    rename_table("admin_users", "users")
  end
end
