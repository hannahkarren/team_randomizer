#Write a Sinatra app that allows the user to enter a list of names separated by
# commas and enter the number of teams. Upon hitting "submit" the app should
#display teams with random members in it with the proper number
require 'sinatra'
get '/' do
  erb :team_randomizer, layout: :default
end

post '/' do
  @names = params[:names].split(",").shuffle
  @numbers= params[:numbers].to_i

  @error = true if @numbers > @names.length || @numbers < 1

  n_teams = @names.length
  team = []
  @tournament = []

  while @names.length > 0 do
    n_teams.times do
      @numbers.times do
          team << @names.pop
      end
      @tournament << team
      team = Array.new
    end
  end

  @tournament.map!{|t| t.compact}

  erb :team_randomizer, layout: :default
end
