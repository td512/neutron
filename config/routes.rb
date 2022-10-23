Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope :attachments do
    post '/upload' => 'attatchments#upload'
    get '/:id' => 'attachments#get'
    delete '/:id' => 'attachment#delete'
  end

  scope :auth do
    post '/' => 'auth#auth'
    delete '/' => 'auth#delete'
    post '/cookies' => 'auth#cookies'
    post '/info' => 'auth#info'
  end

  scope :users do
    get '/' => 'users#get'
    post '/' => 'users#create'
    get '/direct' => 'users#direct'
    get '/available/:username' => 'users#username_available'
    get '/pubkeys/:email' => 'users#pubkeys'
  end

  scope :contacts do
    get '/' => 'contacts#get'
    post '/' => 'contacts#create'
    delete '/' => 'contacts#delete_all'
    put '/:id' => 'contacts#update'
    put '/delete' => 'contacts#delete'
  end

  scope :labels do
    get '/' => 'labels#get'
    post '/' => 'labels#create'
    put '/:id' => 'labels#update'
    put '/order' => 'labels#order'
    delete '/:id' => 'labels#delete'
  end

  scope :messages do
    get '/' => 'messages#list'
    get '/count' => 'messages#count'
    get '/total' => 'messages#total'
    get '/:id' => 'messages#get'
    put '/:action' => 'messages#update'
    delete '/:label' => 'messages#delete_all'
    post '/draft' => 'messages#create'
    put '/draft/:id' => 'messages#update_draft'
    post '/send/:id' => 'messages#send'
    put '/delete' => 'messages#delete'
    put '/label' => 'messages#label'
  end

  scope :conversations do
    get '/' => 'conversations#list'
    get '/:id' => 'conversations#get'
    get '/count' => 'conversations#count'
    put '/:action' => 'conversations#update'
    delete '/:label' => 'conversations#delete_all'
    post '/delete' => 'conversations#delete'
    put '/label' => 'conversations#update_label'
  end

  scope :events do
    get '/:id' => 'events#event'
  end

  scope :settings do
    put '/password' => 'settings#password'
    put '/display' => 'settings#display'
    put '/signature' => 'settings#signature'
    put '/autosave' => 'settings#autosave'
    put '/showimages' => 'settings#toggle_blocked_content'
    put '/composermode' => 'settings#composer_mode'
    put '/viewlayout' => 'settings#view_layout'
    put '/messagebuttons' => 'settings#message_buttons'
    put '/theme' => 'settings#theme'
  end

  scope :keys do
    post '/' => 'keys#create'
    put '/private' => 'keys#update'
  end

  scope :domains do
    get '/' => 'domains#get'
    get '/:id' => 'domain#domain'
    get '/available' => 'domain#available'
  end

  scope :addresses do
    post '/' => 'addresses#create'
    put '/:id/:action' => 'addresses#toggle'
    delete '/:id' => 'addresses#delete'
  end

  scope :payments do
    get '/plans' => 'payments#plans'
    get '/subscriptions' => 'payments#subscriptions'
    get '/methods' => 'payments#methods'
  end

  scope :organizations do
    get '/' => 'organizations#get'
  end

  scope :members do
    get '/' => 'members#get'
  end

  scope :bugs do
    scope :crash do
      get '/' => 'bugs#new'
    end
  end
end
