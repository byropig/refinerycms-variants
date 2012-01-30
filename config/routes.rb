::Refinery::Application.routes.draw do
  resources :variants, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :variants, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
