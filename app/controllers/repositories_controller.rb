class RepositoriesController < ApplicationController
  
  def index
  	resp = Faraday.get("https://api.github.com/user/repos") do |req|
  		req.headers['Authorization'] = "token #{session[:token]}"
  		req.headers['Accept'] = 'application/json'
<<<<<<< HEAD
  	end

  	@repos = JSON.parse(resp.body)
  end

  def create
  	resp = Faraday.post("https://api.github.com/user/repos") do |req|
  		req.body = { name: params[:name] }.to_json
  		req.headers['Authorization'] = "token #{session[:token]}"
  		req.headers['Accept'] = "application/json"
  	end
  	redirect_to root_path
=======
  	end	
  		
  	@repos = JSON.parse(resp.body)
>>>>>>> 176705b85243c6e0daac0ca1d2d3e85d8cca2e56
  end

  def create
  	resp = Faraday.post("https://api.github.com/user/repos") do |req|
  		req.body = { name: params[:name] }.to_json
  		req.headers['Authorization'] = "token #{session[:token]}"
  		req.headers['Accept'] = "application/json"
  	end
  	redirect_to root_path	
  end
  
end
