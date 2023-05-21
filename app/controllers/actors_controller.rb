class ActorsController < ApplicationController
  def search
    @actor = Actor.find_by("lower(name) LIKE ?", "#{params[:name]}%")

    if @actor
      @movies = @actor.movies
    end
  end
end
