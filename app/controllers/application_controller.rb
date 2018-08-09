class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  # this links the root to application/layout.erb
  get '/' do
    erb :'/application/root'
  end

end
