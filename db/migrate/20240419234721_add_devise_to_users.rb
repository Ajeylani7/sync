class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # Uncomment if the email column does not exist
      # t.string :email,              null: false, default: ""

      # Assuming the 'encrypted_password' column does not exist
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Add other fields only if they do not exist
    end

    # Only add indexes for columns that were newly added
    add_index :users, :reset_password_token, unique: true
    # Other indexes as needed
  end

  def self.down
    # If you are adding columns, specify how to roll back those specific changes
    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at
    # And so on for other fields
  end
end
