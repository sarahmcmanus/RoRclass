# From http://tutorials.jumpstartlab.com/projects/web_guesser.html
# To run, "ruby web_guesser.rb" in terminal, 
# then open http://localhost:4567/

require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
	guess = params["guess"].to_i
	message = check_guess(guess)
	erb :index, locals: {number: SECRET_NUMBER, message: message}
end

def check_guess(guess)
	if guess > SECRET_NUMBER + 5
		message = "Way too high!"
	elsif guess > SECRET_NUMBER
		message = "Too high!"
	elsif guess < SECRET_NUMBER - 5
		message = "Way too low!"
	elsif guess < SECRET_NUMBER
		message = "Too low!"
	elsif guess == SECRET_NUMBER
		message = "You got it right! The secret number is #{SECRET_NUMBER}!"
	else 
		message = "I didn't understand that, please try again with a number."
	end
end

