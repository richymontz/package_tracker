class Vendor < ApplicationRecord
  has_many :orders

  def delivery_days_average
    orders_count = orders.delivered.count
    return 0 if orders_count.zero?
    orders.delivered.map(&:days_for_delivery).reduce(:+) / orders_count
  end
end
