class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)

   (m1.upcase == m2.upcase) or
    ((m1.upcase == 'R') and (m2.upcase == 'S')) or
    ((m1.upcase == 'S') and (m2.upcase == 'P')) or
    ((m1.upcase == 'P') and (m2.upcase == 'R'))
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
	game.each do |player|
    	name, move = player
    	raise NoSuchStrategyError unless move.match /(R|P|S)/i
	end

  	player1, player2 = game
  	name1, move1 = player1
  	name2, move2 = player2

  	rps_result(move1, move2) ? player1 : player2
end

def rps_tournament_winner(tournament)
	roundA, roundB = tournament
	if roundA[0].class == String
    	player1 = roundA
    	player2 = roundB
  	else
    	player1 = rps_tournament_winner(roundA)
    	player2 = rps_tournament_winner(roundB)
  	end

  	game = []
	game << player1
	game << player2
  	return rps_game_winner(game)
end
