class HomeController < ApplicationController
  def index
    @sites = Site.all
  end
  
  def test
    
  end
  

end
