require 'csv'

namespace :movies do
  desc 'Import movies from CSV'
  task import: :environment do
    file_path = Rails.root.join('data/movies.csv')
    Rails.logger.info 'Starting movies import...'
    import_movies(file_path)
    Rails.logger.info 'Movies import finished!'
  end

  def import_movies(file_path)
    movies_data = get_movies_data(file_path)

    Movie.transaction do
      movies_data.each do |movie_name, data|
        movie = create_movie(data)

        create_actors(data[:actors].uniq, movie)
        create_filming_locations(data[:filming_locations].uniq, movie)
        create_countries(data[:countries].uniq, movie)

        Rails.logger.info "Created movie with title: #{movie.title}"
      end
    end
  rescue StandardError => e
    Rails.logger.error "Error during import: #{e.message}"
  end

  def get_movies_data(file_path)
    movies_data = {}
    CSV.foreach(file_path, headers: true) do |row|
      movie_name = row['Movie'].strip

      movies_data[movie_name] ||= {
        title: movie_name,
        description: row['Description'],
        year: row['Year'],
        director: row['Director'],
        actors: [],
        filming_locations: [],
        countries: []
      }

      movies_data[movie_name][:actors] << row['Actor']
      movies_data[movie_name][:filming_locations] << row['Filming location']
      movies_data[movie_name][:countries] << row['Country']
    end
    movies_data
  end

  def create_movie(data)
    Movie.create!(
      title: data[:title],
      description: data[:description],
      year: data[:year],
      director: data[:director]
    )
  end

  def create_actors(actors_data, movie)
    actors_data.each do |actor_name|
      actor = Actor.find_or_create_by!(name: actor_name.strip)
      movie.actors << actor
    end
  end

  def create_filming_locations(filming_locations_data, movie)
    filming_locations_data.each do |location_name|
      filming_location = FilmingLocation.find_or_create_by!(name: location_name.strip)
      movie.filming_locations << filming_location
    end
  end

  def create_countries(countries_data, movie)
    countries_data.each do |country_name|
      country = Country.find_or_create_by!(name: country_name.strip)
      movie.countries << country
    end
  end
end
