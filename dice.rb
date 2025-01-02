require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

  get("/") do
    erb(:elephant)
  end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	erb(:two_six)
 
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:two_tens)
	
end

get("/dice/5/4") do
  first_die = rand(1..4)
  first_2 = rand(1..4)
  first_3 = rand(1..4)
  first_4 = rand(1..4)
  first_5 = rand(1..4)

  sum = first_die + first_2 + first_3 + first_4 + first_5
	
  @outcome = "You rolled a #{first_die}, #{first_2}, #{first_3}, #{first_4}, and a #{first_5} for a total of #{sum}."
	erb(:five_four)

end

get("/dice/1/20") do
  @die = rand(1..20)

  @outcome = "You rolled a #{@die}."

  erb(:one_twenty)
end

get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six)
end
