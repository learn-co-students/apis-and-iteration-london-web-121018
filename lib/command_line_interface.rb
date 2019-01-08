def welcome
  puts "Welcome!"
  # puts out a welcome message here!
end

def get_character_from_user
  puts "please enter a character name"
  character_name = gets.chomp.split(" ").map(&:capitalize).join(" ")
  # use gets to capture the user's input. This method should return that input, downcased.
end
