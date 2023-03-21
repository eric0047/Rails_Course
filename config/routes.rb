Rails.application.routes.draw do
  get "/about", to: "clubs#about"
  get "/contact", to: "clubs#contact"
end
