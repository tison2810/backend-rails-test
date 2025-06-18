Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post "api/import", to: "api/scores#import"
  get "api/show/:regNum", to: "api/scores#show"
  get "api/top/:groupName", to: "api/scores#show_top"

  get "api/stat/each/:sub", to: "api/stats#score_stat"
  get "api/stat/all", to: "api/stats#all_score_stat"
  # Defines the root path route ("/")
  # root "posts#index"
end
