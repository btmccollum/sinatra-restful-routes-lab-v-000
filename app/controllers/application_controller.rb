class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)

    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    
    redirect '/recipes'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    @recipe.ingredients = params[:ingredients]
    @recipe.save

    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
  
    erb :show
  end

  get '/recipes' do
    erb :recipes
  end

end