def score(game)
	score = 0

	game.each_with_index do |n,i|
		score += n.reduce(:+)
		score += game[i+1][0] if n.reduce(:+) == 10 && i < 9
		
		next if n[0] != 10
		
		score += game[9][1] if i ==8
		score += game[i+2][0] if i < 8		
	end
	score
end
