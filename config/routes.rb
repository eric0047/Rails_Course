Rails.application.routes.draw do
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new"
  get "/about", to: "clubs#about"
  get "/contact", to: "clubs#contact"
end
