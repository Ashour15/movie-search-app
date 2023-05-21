class MoviesController < ApplicationController
  def index
    @movies = Movie.order(average_stars: :desc)
  end
end
