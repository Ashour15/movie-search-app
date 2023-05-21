class AverageStarsWorker
  include Sidekiq::Worker

  def perform(movie_id)
    movie = Movie.find(movie_id)
    average_stars = calculate_average_stars(movie)
    movie.update(average_stars: average_stars)
  end

  private

  def calculate_average_stars(movie)
    reviews = movie.reviews
    if reviews.present?
      total_stars = reviews.sum(:stars)
      total_reviews = reviews.count
      average_stars = total_stars.to_f / total_reviews
      average_stars.round(2)
    else
      return 0
    end
  end
end
