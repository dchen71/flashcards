Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  #Decks > cards
  resources :decks do
    member do

    end
  end

end
