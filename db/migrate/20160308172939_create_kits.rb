class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
