class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect :'/home'
    else
      erb :'/sessions/login'
    end
  end

  post '/login' do
    if params[:username] != '' && params[:password] != ''
      login(params)
    else
      flash[:message] = "All fields need to be completed"
      redirect :'/login'
    end
  end

end
