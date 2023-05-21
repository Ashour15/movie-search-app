class AverageStarsWorker
  include Sidekiq::Worker

  def perform
    Movie.all.each do |movie|
      update_movie_average_stars(movie)
    end
  end

  private

  def update_movie_average_stars(movie)
    reviews = movie.reviews
    average_stars = 0
    if reviews.present?
      total_stars = reviews.sum(:stars)
      total_reviews = reviews.count
      average_stars = total_stars.to_f / total_reviews
      average_stars.round(2)
    end
    movie.update(average_stars: average_stars)
  end
end

