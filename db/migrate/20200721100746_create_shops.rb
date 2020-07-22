class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.float :evaluation, null: false
      t.integer :prefecture_code, null: false
      t.string :station, null: false
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
