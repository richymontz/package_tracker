addresses = ['333 Fifth St. Winter Springs, FL 32708',
             '11 Maple Drive Jupiter, FL 33458',
             '130 Gulf St. West Palm Beach, FL 33414',
             '623 East Carson Street Tallahassee, FL 32310',
             '8201 NW. Augusta Street Winter Haven, FL 33880',
             '945 East Gonzales Street Hialeah, FL 33012',
             '803 Mayflower Street Daytona Beach, FL 32119',
             '495 Summit Ave. Orlando, FL 32810',
             '445 W. Westminster St. Winter Park, FL 32792',
             '99 Longbranch Ave. Miami Beach, FL 33141']


30.times do
  vendor = Vendor.create(name: Faker::Name.name_with_middle)

  # Out for deliver
  (50..60).to_a.sample.times do
    rand_days = (5 + Random.rand(10))
    Order.create(shipping_address: addresses[Random.rand(10)],
                 tracking_number: Faker::Number.hexadecimal(6).upcase,
                 created_at: rand_days.days.ago,
                 order_number: Faker::Number.number(10),
                 status: 0,
                 vendor: vendor)
  end

 # Delivered
  (50..60).to_a.sample.times do
    rand_days = (5 + Random.rand(10))
    Order.create(shipping_address: addresses[Random.rand(10)],
                 tracking_number: Faker::Number.hexadecimal(6).upcase,
                 delivered_at: (rand_days.days.ago + (1 + Random.rand(7)).days),
                 created_at: rand_days.days.ago,
                 order_number: Faker::Number.number(10),
                 status: 1,
                 vendor: vendor)
  end
end
