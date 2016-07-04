class AddToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :med_id, :integer
    add_column :prices, :pharmacy_id, :integer
  end
end
