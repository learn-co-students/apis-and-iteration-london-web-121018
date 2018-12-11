require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  finalarray = []
  filmarray =[]
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  binding.pry
  response_hash = JSON.parse(response_string)

  response_hash.each do |level1, level2|
      if level1 == "results"
        level2.each do |character|
          if character["name"].downcase == character_name
            filmarray = character["films"]
          end
        end
      end
  end

  filmarray.each do |films|
    temp = RestClient.get(films)
    finalarray << JSON.parse(temp)
  end
  finalarray
end

def print_movies(films)
  puts "Their films are:"
  puts "------"
  films.each do |film|
    puts "Title: #{film["title"]}"
    puts "Director: #{film["director"]}"
    puts "Producer: #{film["producer"]}"
    puts "Release Date: #{film["release_date"]}"
    puts "URL: #{film["url"]}"
    puts "------"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
