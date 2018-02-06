module VendorsHelper
  def vendor_for_select_options(vendors)
    options_from_collection_for_select(vendors, 'id', 'name', @vendor.try(:id))
  end
end
