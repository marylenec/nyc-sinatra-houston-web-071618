class LandmarksController < ApplicationController

  # list all the landmarks on the homepage
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  # CREATE Step 1
  # load the form to create new landmark
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  # SHOW individual landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  # EDIT Step 1
  # load the form to edit the individual landmark
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  # CREATE Step 2
  post '/landmarks' do
    Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

  # EDIT Step 2
  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])

    redirect "/landmarks/#{params[:id]}"
  end

  # Delete Landmarks
  delete '/landmarks/:id/delete' do
    @landmark = Landmark.find(params[:id])
    @landmark.delete
    redirect '/landmarks'
  end

end
