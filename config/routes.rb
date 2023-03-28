Rails.application.routes.draw do

  # delete "/resumes/:id" , to: "resumes#destroy"
  # patch "/resumes/:id" , to: "resumes#update"
  # get "/resumes/:id/edit" , to: "resumes#edit", as: "edit_resume"
  # get "/resumes/new", to: "resumes#new", as: "new_resumes"
  # get "/resumes/:id" , to: "resumes#show", as: "resume"
  # get "/resumes", to: "resumes#index"
  # post "/resumes", to: "resumes#create"
  resources :resumes

  # get '/', to: "clubs#home", as: "root"
  root "clubs#home"
  # 只有root可以這樣寫

  get "/about", to: "clubs#about"
  get "/contact", to: "clubs#contact"
end
