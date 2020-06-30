Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    
    resources :games do
        
        resources :difficulty_modes do
            resources :deck_selections
        end
        
        resources :decks do 
            resources :cards
        end
        
        resources :select_difficulty do
            resources :play
        end
        
    end
    

    
    root 'welcome#index'
end
