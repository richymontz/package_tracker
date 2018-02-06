addresses = ['333 Fifth St. Winter Springs, FL 32708',
           '11 Maple Drive Jupiter, FL 33458',
           '130 Gulf St. West Palm Beach, FL 33414',
           '9948 Bay Meadows St. Opa Locka, FL 33056',
           '8201 NW. Augusta Street Winter Haven, FL 33880',
           '945 East Gonzales Street Hialeah, FL 33012',
           '803 Mayflower Street Daytona Beach, FL 32119',
           '495 Summit Ave. Orlando, FL 32810',
           '445 W. Westminster St. Winter Park, FL 32792',
           '7929 Wilson Avenue Miami, FL 33177']

Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :orders
  resources :vendors
  get :out_of_normal_deliveries, to: 'dashboard#out_of_normal_deliveries'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
