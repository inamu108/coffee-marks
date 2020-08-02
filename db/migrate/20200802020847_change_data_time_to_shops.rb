class ChangeDataTimeToShops < ActiveRecord::Migration[6.0]
  def change
    change_column :shops, :time, :string
  end
end
