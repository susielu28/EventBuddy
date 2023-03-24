class AddUsersToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :user_1, foreign_key: { to_table: 'users'}
    add_reference :chatrooms, :user_2, foreign_key: { to_table: 'users'}
  end
end
