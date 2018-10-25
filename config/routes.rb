Rails.application.routes.draw do

  devise_for :users
  resources :students, :sections, :courses, :enrollments do
    collection do
      get 'search'
    end
  end

  resources :enrollments
  resources :sections
  resources :courses
  resources :students

  root to: 'courses#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
