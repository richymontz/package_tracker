class DashboardController < ApplicationController
  def index
    @q = Order.ransack(params[:q])
    @order = Order.new
    @orders = @q.result.includes(:vendor).paginate(page: params[:page]).out_for_delivery
    @vendors = Vendor.all
  end

  def out_of_normal_deliveries
    @q = Order.ransack(params[:q])
    @orders = @q.result.includes(:vendor).paginate(page: params[:page]).delivered.order(created_at: :desc)
    @vendors = {}
    Vendor.all.each do |vendor|
      @vendors[vendor.id] = {
        name: vendor.name,
        delivery_time_average: vendor.delivery_days_average
      }
    end
  end
end
