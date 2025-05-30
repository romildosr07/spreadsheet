Rails.application.routes.draw do
  get 'static/index'
  resources :part_or_services do
    collection do
      get 'by_spreadsheet/:spreadsheet_table_id', to: 'part_or_services#by_spreadsheet'
      delete "by_spreadsheet/:spreadsheet_table_id", to: "part_or_services#destroy_by_spreadsheet"
    end
  end

  resources :spreadsheet_tables
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'static#index'

  get '*path', to: 'static#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end
