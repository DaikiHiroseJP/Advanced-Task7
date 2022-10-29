class Chats < ActiveRecord::Migration[6.1]
  def change
    drop_table :chats
  end
end
