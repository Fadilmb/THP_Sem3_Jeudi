require './Player'
require './Board'

class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    puts "name of the player1 ?"
    name_of_player_1 = gets.chomp.to_s
    @player1 = Player.new(name_of_player_1,"X")
    puts "name of the player2 ?"
    name_of_player_2 = gets.chomp.to_s
    @player2 = Player.new(name_of_player_2, "O")
    @Board = Board.new
    @@turn_number = 0
    go
  end

  def go
    # TO DO : lance la partie
    while true
    	@@turn_number +=1
    	if @@turn_number < 10
    		turn
    	else
    		puts "Match nul"
      	@Board.display
    		abort
    	end
    end
  end

  def turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  	if @@turn_number % 2 == 0
  		@Board.display
  		@Board.play("O")
  		@Board.victory?(@player2.name)
  		@player2.win +=1
  	else
  		@Board.display
  		@Board.play("X")
  		@Board.victory?(@player1.name)
  		@player1.win +=1
  	end
  end
end

Game.new