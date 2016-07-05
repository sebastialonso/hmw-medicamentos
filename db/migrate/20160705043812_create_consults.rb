class CreateConsults < ActiveRecord::Migration
  def change
    create_table :consults do |t|
      t.string :user
      t.integer :med_id

      t.timestamps null: false
    end
  end
end
