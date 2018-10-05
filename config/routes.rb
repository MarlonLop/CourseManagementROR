Rails.application.routes.draw do
  resources :enrollments
  resources :sections
  resources :courses
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
