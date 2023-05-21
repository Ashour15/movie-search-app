require 'csv'

namespace :movies do
  desc 'Import reviews'
  task import_reviews: :environment do
    file_path = Rails.root.join('data/reviews.csv')
    Rails.logger.info 'Starting reviews import...'

    begin
      CSV.foreach(file_path, headers: true) do |row|
        movie_name = row['Movie'].strip
        user_name = row['User']
        stars = row['Stars'].to_i
        review = row['Review']

        movie = Movie.find_or_create_by(title: movie_name)
        user = User.find_or_create_by(name: user_name)

        review = movie.reviews.new(
          user: user,
          stars: stars,
          review: review
        )

        if review.save
          Rails.logger.info "Imported review for movie: #{movie.title} by user: #{user.name}"
        else
          Rails.logger.error "Failed to import review for movie: #{movie.title} by user: #{user.name}. Errors: #{review.errors.full_messages.join(', ')}"
        end
      end

      Rails.logger.info 'Import reviews finished!'
    rescue StandardError => e
      Rails.logger.error "An error occurred during reviews import: #{e.message}"
    end
  end
end
