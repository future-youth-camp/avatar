class RemoveDeviseColumnsFromMember < ActiveRecord::Migration
  def change
    remove_column :members, :encrypted_password
    remove_column :members, :reset_password_token
    remove_column :members, :reset_password_sent_at
    remove_column :members, :remember_created_at
    remove_column :members, :sign_in_count
    remove_column :members, :current_sign_in_at
    remove_column :members, :last_sign_in_at
    remove_column :members, :current_sign_in_ip
    remove_column :members, :last_sign_in_ip
  end
end
