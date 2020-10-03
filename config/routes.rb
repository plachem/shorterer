Rails.application.routes.draw do
  post '/urls', to: 'urls#get_short_url'
  get '/urls/:short_url/stats', to: 'urls#stats'
  get '/urls/:short_url', to: 'urls#short_url'
end
