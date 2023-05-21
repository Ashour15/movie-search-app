# Movie and Actor search App

This is a Ruby on Rails application to show overview of the movies sorted by average review stars and allow searching for an actor to show the related movies.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Requirements

- Ruby (version 6.1.4)
- Ruby on Rails (version 3.0.0)
- sqlite3 (version 1.4)
- sidekiq (version 6.2.0)

## Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/your-username/movie-review-app.git
   cd movie-search-app
   bundle install
   rails db:create
   rails db:migrate
   bundle exec sidekiq 
   rails server

## Importing Movies and Reviews

To import movies and reviews from the provided CSV files, follow these steps:

1. Open a terminal and navigate to your project directory.

2. Run the following commands in order:

   ```shell
   rake movies:import
   rake movies:import_reviews

**NOTE:** `movies.csv` and `reviews.csv` files are already placed in a directory called "data"

## Assumptions

In designing the database and functionality of this application, the following assumptions were made:

1. **Movie Model**: The `Movie` model is designed to have the following fields: `title`, `description`, `year`, and `director`. These fields provide essential information about each movie.

2. **Separate Tables**: Separate tables were created for `actors`, `countries`, and `filming locations`. This allows for a more structured organization of data and establishes many-to-many relationships for each of these entities.

3. **Uniqueness of Movie Title**: When importing movies, it is ensured that there are no duplicates by identifying each movie by its unique title. This helps maintain data integrity and avoids duplication in the database.

4. **Average Stars Calculation**: A column named `average_stars` was added to the `movies` table. This column is used for sorting the movies in descending order based on their average stars rating. Instead of calculating the average stars from all movies every time, a scheduled job updates this value for all movies once every week. This reduces the frequency of calculations and improves performance. The specific time period for updating the average stars can be adjusted according to the business requirements.

5. **Review Frequency**: Reviews are not used to calculate the average stars in real-time. Instead, the calculation is performed during the weekly update. This approach reduces the number of times the calculation method is called and optimizes the system's performance. Reviews are recorded separately and associated with movies for reference.

These assumptions were made based on the specific requirements and considerations of the application.

## Todo List

To further enhance the functionality and user experience of the application, the following tasks can be considered:

1. **Add Pagination for Movies List**: Implement pagination for the movies list to improve performance and navigation when dealing with a large number of movies.

2. **Add Sorting Options for Movies List**: Provide sorting options (e.g., by title, year, average stars) for the movies list. This allows users to customize the order in which movies are displayed.

3. **Create a Separate Model for Director**: Instead of storing the director's name as a string column in the movies table, create a separate `Director` model and establish a many-to-many relationship between `Director` and `Movie`. This provides better organization and flexibility for managing directors and their associated movies.

4. **Enhance Actor Search**: Modify the search form to allow searching for more than one actor. Improve the search functionality to display movies related to the selected actors. This enables users to find movies featuring specific actors or combinations of actors.

These enhancements aim to provide additional features, improve data management, and enhance the overall user experience of the application.
