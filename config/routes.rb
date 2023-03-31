Rails.application.routes.draw do
  # get '/', to: "clubs#home", as: "root"
  root "clubs#home"
  # 只有root可以這樣寫
  # 最常使用的路徑放最上面 ex 首頁


  resource :sessions, only: [:create, :destroy] 

  resource :users, except: [:new, :delete] do
    # 如果路徑想改路徑 do 前面用 path: ""
    get "sign_up", action: "new"
  # 用action可以直接改controller裡method的名字，如果用 to: "user#new" 萬一resource後面的key更改了還要連動一起改，會比較麻煩
    get "sign_in"
  end
  # delete "/resumes/:id" , to: "resumes#destroy"
  # patch "/resumes/:id" , to: "resumes#update"
  # get "/resumes/:id/edit" , to: "resumes#edit", as: "edit_resume"
  # get "/resumes/new", to: "resumes#new", as: "new_resumes"
  # get "/resumes/:id" , to: "resumes#show", as: "resume"
  # get "/resumes", to: "resumes#index"
  # post "/resumes", to: "resumes#create"
  resources :resumes

  

  get "/about", to: "clubs#about"
  get "/contact", to: "clubs#contact"
end
