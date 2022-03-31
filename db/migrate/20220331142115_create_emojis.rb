class CreateEmojis < ActiveRecord::Migration[6.0]
  def change
    create_table :emojis do |t|
      t.string :symbol

      t.timestamps
    end
  end
end
