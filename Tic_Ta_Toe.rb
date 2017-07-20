require './Player'
require './Board'
class Game
  def initialize
    #TO DO : créé 2 joueurs, créé un board
    puts "name of the player1 ?"
    name_of_player_1 = gets.chomp
    @player1 = Player.new(name_of_player_1,"X")
    puts "name of the player2 ?"
    name_of_player_2 = gets.chomp
    @player2 = Player.new(name_of_player_2, "O")
    @io = Board.new
    @@turn_number = 0
    go
  end

  def go
    # TO DO : lance la partie

    while true
    	turn
    	if @@turn_number < 10
    	else
    	 puts "Match nul"
       display
    	 abort
    	end
    end
  end

  def turn
    #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
  	@@turn_number +=1
  	if @@turn_number % 2 == 0
  	@io.display
  	@io.play("O")
  	@io.victory?
  	@player2.win +=1
  	else
  	@io.display
  	@io.play("X")
  	@io.victory?
  	@player1.win +=1
  	end
  end
end

Game.new