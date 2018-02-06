class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :shipping_address
      t.string :tracking_number
      t.references :vendor, foreign_key: true
      t.string :status
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
