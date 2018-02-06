class Order < ApplicationRecord
  enum status: %i[out_for_delivery delivered]

  belongs_to :vendor

  geocoded_by :shipping_address
  after_validation :geocode

  def days_for_delivery
    (created_at.to_i - delivered_at.to_i) / 1.day
  end

  def deliver!
    delivered!
  end
end
