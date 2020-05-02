Rails.application.routes.draw do

    #複數      符號    打開所有路徑七條路徑  針對某候選人 member幫你＋id /user/id/vote    看所有列表 >  collection user/vote_list
  resources :candidates do
    member do 
      post :vote
    end

  #   collection do
  #     post :vote
  # end
  
  # post '/candidates/:id/vote' ,to: 'candidates#vote' 
  end
end


