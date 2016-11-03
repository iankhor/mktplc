class HomeController < ApplicationController
  skip_before_action :authenticate_user!, except: :test

  def index
  
  end

  def test

  end

end
