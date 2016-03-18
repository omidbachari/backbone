Rails.application.routes.draw do
  root to: 'application#index'
  get '*page', to: 'application#index'
end
