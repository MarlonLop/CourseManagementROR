Rails.application.routes.draw do

  resources :students, :sections, :courses, :enrollments do
    collection do
      get 'search'
    end
  end

  resources :enrollments
  resources :sections
  resources :courses
  resources :students

  root 'courses#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
