json.extract! order, :id, :shipping_address, :tracking_number, :vendor_id, :status, :delivered_at, :created_at, :updated_at
json.url order_url(order, format: :json)
