class HomeController < ApplicationController
  before_action :authenticate_user! 	
  def index
  	@tweet = Tweet.new
  end
end
