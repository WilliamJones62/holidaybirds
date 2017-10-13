class CreateHolidaybirds < ActiveRecord::Migration[5.1]
  def change
    create_table :holidaybirds do |t|
      t.string :channel
      t.string :sku
      t.string :description
      t.integer :shipped
      t.integer :ordered
      t.integer :forecast
      t.integer :harvest
      t.datetime :datetime

      t.timestamps
    end
  end
end
