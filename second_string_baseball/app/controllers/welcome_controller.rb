class WelcomeController < ApplicationController
  def index

  end

  def home
    render :layout => false
  end

  def roster
    render :layout => false
  end

  def statistics
    render :layout => false
  end 

  def gallery
    render :layout => false
  end
end
