Rails.application.routes.draw do
  root "messages#index"
  
  # get "/message", to: "message#index"

  # route param captures segment of request parth 
  # and puts into param (xxx/message/1 >> id=1)
  # get "/message/:id", to: "message#show" # READ

  resources :messages

end
