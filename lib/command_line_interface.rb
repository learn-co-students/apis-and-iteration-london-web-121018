def welcome
  puts "Hello! Please enter a character"# puts out a welcome message here!
end

def get_character_from_user
  puts "Please enter a character name!"
  character = gets.chomp
  character.downcase# use gets to capture the user's input. This method should return that input, downcased.
end
