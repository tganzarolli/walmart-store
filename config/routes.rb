WalmartStore::Application.routes.draw do
  get "main/index"

  devise_for :users

  root to: "main#index"

  scope "api", :format => true, :constraints => { :format => 'json' } do
    resources :users, except: [:new, :edit]
    resources :products, except: [:new, :edit] do
      collection do
        get 'search'
      end
    end
  end

end