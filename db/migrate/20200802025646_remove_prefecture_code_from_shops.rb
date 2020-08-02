class RemovePrefectureCodeFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :prefecture_code, :integer
  end
end
