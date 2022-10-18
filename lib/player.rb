#Classe contenant le fonctionnement type d'un joueur virtuel
class Player

    attr_accessor :name, :life_points
    enemies = []

#Initialisation des informations joueurs
    def initialize(name)
        @name = name
        @life_points = 10
        @@enemies << self
    end

#Affichage du nombre de points
    def show_state
        print "#{@name} a #{@life_points} points de vie." if @life_points > 0
    end

#Décrémentation du nombre de points
    def gets_damage(damage)
        @life_points -= damage
        if @life_points <= 0
            puts "\nLe joueur #{@name} a été tué!"
        end
    end

#Attaque et nombre de points d'attaque    
    def attack(player)
        damages = compute_damage
        puts "Le joueur #{@name} attaque le joueur #{player.name}!"
        puts "il lui inflige #{damages} points de dommages"
        player.gets_damage(damages)
    end

#Automatisation du caractère aléatoire des points d'attaque de 1 à 6
    def compute_damage
        return rand(1..6)
    end

end

#**************************************************************

#La classe HumanPlayer est l'héritage de la classe Player
class HumanPlayer < Player
    attr_accessor :weapon_level

#Initialisation des données du joueur humain
    def initialize(name)
        @life_points = 100
        @weapon_level = 1
    end

#Définit la vie et l'arme du joueur humain
    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end

#Crée une attaque multipliée par l'arme; venant chercher la fonction #attack dans Player
    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        dice = rand(1..6)
        puts "Tu as trouvé una arme de niveau #{dice}."
        if dice > @weapon_level
            @weapon_level = dice
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            puts "Comptes tu vraiment te battre avec ce machin?! Jette ce truc."
        end
    end

    def search_health_pack
        dice = rand(1..6)
        if dice == 1
            puts "Tu n'as rien trouvé."
        elsif dice >= 2 and dice <= 5
            @life_points += 50
            puts "Super, tu gagnes 50 points de vie!"
        elsif dice == 6
            if @life_points == 100
               @life_points = 100
            elsif (80 + @life_points) >= 100
               @life_points = 100
            elsif (80 + @life_points) < 100
               @life_points += 80
            end
            puts "Super, tu gagnes 80 points de vie!"
        end
    end
end

