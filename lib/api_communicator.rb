require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].each do |element|
    if element["name"] == character_name
        return element['films']
    end
  end

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def movies_stat(film)
    film.map do |elem|
      movie_string = RestClient.get(elem)
      movie_hash = JSON.parse(movie_string)
  end
end


def print_movies(stats)
  puts ""
  stats.each do |elem|
      puts "Title: #{elem["title"]}
      Episode: #{elem["episode_id"]}
      Director: #{elem["director"]}
      Release date: #{elem["release_date"]}"
      puts "--------------------------------------"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  stats = movies_stat(films)
  #binding.pry
  print_movies(stats)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
