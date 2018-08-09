class FiguresController < ApplicationController

  get '/figures' do
     @figures = Figure.all
     erb :'figures/index'
   end

  # CREATE Step 1
  # load the form to create new figure
    get "/figures/new" do
      # figures/show
      erb :'figures/new'
    end

    get "/figures/:id" do
      @figure = Figure.find(params[:id])
      # figures/show
      erb :'figures/show'
    end

    # CREATE Step 2
    # form to create new figure
    post "/figures" do

      @figure = Figure.create(params[:name])

      # if landmark does not exist, create it
      # binding.pry
      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      end

      # if title does not exisit, create it,
      if !params[:title][:name].empty?
        @figure.titles << Title.create(params[:title])
      end

      @figure.save
      redirect "/figures/#{@figure.id}"
    end

  #   if figure[landmark_ids][].empty?
  #     figure[landmark_ids][] << Title.new
  #
  end
