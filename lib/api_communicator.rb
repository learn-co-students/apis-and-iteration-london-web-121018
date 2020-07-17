require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  new_arr = []
  response_hash = JSON.parse(RestClient.get("http://www.swapi.co/api/people/"))
  response_hash["results"].each do |item|
    if item["name"].downcase == character_name
      item["films"].each do |url|
        site_json = RestClient.get(url)
        new_arr << JSON.parse(site_json)
      end
    end
  end
  new_arr
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

def print_movies(films)
  films.each do |film|
    puts film["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?



Collapse 
Message Input

Message Sunny
