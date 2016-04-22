class WelcomeController < ApplicationController
  def index
    @books = Book.all
  end
  
  def about
    end
  
  def contact
     end
end
