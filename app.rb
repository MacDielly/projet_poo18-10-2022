# Appeller la lib Ruby
require_relative 'lib/player'
require_relative 'lib/game'

#Création des joueurs
player1 = Player.new("Josiane")
player2 = Player.new("José")

#Boucle de jeu pour les attaques successives
while player1.life_points > 0 && player2.life_points > 0

puts "***********************************"
puts "Voici l'état de ces manants:"
puts "***********************************"
puts
puts "\n#{player1.show_state}"
puts "\n#{player2.show_state}"
puts
puts "***********************************"
puts "Gueusaille, joutez donc!"
puts "***********************************"
puts

player1.attack(player2)
puts
break if player2.life_points <= 0

player2.attack(player1)
puts
end