class AddEmojiToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :emoji, null: false, foreign_key: true
  end
end
