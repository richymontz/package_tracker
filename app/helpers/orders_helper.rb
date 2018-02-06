module OrdersHelper
  def vendor_name(order)
    order.vendor.try(:name)
  end

  def order_status_badge(order)
    if order.delivered?
      link_to(order.status || 'normal', 'javascript:void(0)', class: 'btn btn-success btn-xs')
    else
      'On delivery'
    end
  end

  def order_delivery_status_badge(order)
    vendor_average_delivery_time = @vendors[order.vendor_id][:delivery_time_average].abs
    order_delivery_days_duration = order.days_for_delivery.abs

    if order_delivery_days_duration <= vendor_average_delivery_time + 2
      # Normal delivery time
      link_to('Normal', 'javascript:void(0)', class: 'btn btn-success btn-xs')
    elsif order_delivery_days_duration > vendor_average_delivery_time + 4
      link_to('Very late', 'javascript:void(0)', class: 'btn btn-danger btn-xs')
    else
      link_to('Not normal', 'javascript:void(0)', class: 'btn btn-warning btn-xs')
    end
  end

  def orders_map_markers(orders)
    orders.map { |o| { lat: o.latitude, lng: o.longitude, order_number: "Order #{o.order_number}" } }
  end
end
