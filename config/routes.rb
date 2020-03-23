Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do 
    	resources :employees do
    		resources :payroll_invoices, only: [:index]
    	end
    	resources :payroll_invoices, only: [:create]
    	resources :incidences, only: [:create]
    end
  end
end
