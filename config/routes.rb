Rails.application.routes.draw do
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as: "new_resumes"
  post "/resumes", to: "resumes#create"

  # get '/', to: "clubs#home", as: "root"
  root "clubs#home"
  # 只有root可以這樣寫

  get "/about", to: "clubs#about"
  get "/contact", to: "clubs#contact"
end
