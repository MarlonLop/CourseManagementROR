Rails.application.routes.draw do
  resources :enrollments
  resources :sections
  resources :courses
  resources :students

  get 'courses/index'
  root 'courses#index'

  resources :students do
    collection do
      get 'search'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
