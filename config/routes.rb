Rails.application.routes.draw do
  root 'static_pages#index'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
end
