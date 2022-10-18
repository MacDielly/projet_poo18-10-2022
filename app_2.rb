#Appeller la lib Ruby
require_relative 'lib/player'
require_relative 'lib/game'

#Message d'acceuil
puts "-------------------------------------------------"
puts "|    Bienvenue sur 'POO D'OORS versus plèbe !   |"
puts "|         Que trépasse si je faiblis !          |"
puts "-------------------------------------------------"

#Création du joueur
print 'Quel est votre prénom? '
name = gets.chomp
user = HumanPlayer.new(name)

#Création des PNJ
player1 = Player.new("Josiane")
player2 = Player.new("José")
system("clear")

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

#Menu des actions possibles
    puts "***********************************"
    puts "Quelle action souhaites tu effectuer?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher de quoi s soigner"
    puts
    puts "Attaquer un joueur en vue :"
    print " 0 - "
    puts "#{player1.show_state}"
    print " 1 - "
    puts "#{player2.show_state}"
    puts "***********************************"
    puts

#Choix de l'utilisateur
    print "Tapez votre choix: "
    action_choice = gets.chomp
    if action_choice == "a"
        user.search_weapon
    elsif action_choice == "s"
        user.search_health_pack
    elsif action_choice == "0"
        user.attack(player1)
    elsif action_choice == "1"
        user.attack(player2)
    else puts "ERREUR: Recommence!"
    end

end

