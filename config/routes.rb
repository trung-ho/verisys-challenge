Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  match 'convert_to_json', controller: :application, action: :convert_to_json, via: :post
end
