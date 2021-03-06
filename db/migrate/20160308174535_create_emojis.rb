class CreateEmojis < ActiveRecord::Migration
  def change
    create_table :emojis do |t|
      t.string :name, null: false
      t.string :image
      t.references :kit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
