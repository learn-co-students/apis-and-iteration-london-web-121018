require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  film_urls = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
    response_hash["results"].each do |info|
      if info["name"] == character_name
        film_urls = info["films"]
      end
    end
    film_urls
end

#get_character_movies_from_api("Luke Skywalker")

def get_film_info(film_urls)
  title_director = []
  film_urls.each do |url|
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    #response_hash["title"]
    #response_hash["director"]
    title_director << {"title":response_hash["title"],"director":response_hash["director"]}
  end
  title_director
end

#get_film_info(["https://www.swapi.co/api/films/2/","https://www.swapi.co/api/films/6/"])

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films)
  films.each do |film_info|
    puts "---------------------------"
    film_info.each do |key,value|
      puts "#{key.capitalize}: #{value}"
    end
  end
end

def show_character_movies(character)
  array = get_character_movies_from_api(character)
  films = get_film_info(array)
  print_movies(films)
end

show_character_movies("Luke Skywalker")


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
