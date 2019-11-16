class StaticPagesController < ApplicationController
  def home
    @sports = Sport.select(:kind).distinct
  end

  def about
  end
  
  def baseball
  end
end
