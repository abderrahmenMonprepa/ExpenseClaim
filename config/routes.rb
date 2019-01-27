Rails.application.routes.draw do
  devise_for :users ,
  controllers: {  registrations: 'registrations' }
  resources :expenses do
  	member do
      get 'approve'
  	end
  end

  root 'expenses#index'

  get 'user_expenses' => 'expenses#user_expenses'
  get 'statics' => 'statistics#new'
  post 'show' => 'statistics#ShowExpenses'
  post 'display_stats' => "statistics#ShowExpenses"
end
