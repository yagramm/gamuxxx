class Player

	attr_accessor :name, :life_points #on permet la lecture et la modification de ces variables

	def initialize (name) #actions qui s'exécuteront dès lors de la création d'une nouvelle instance
		@name = name
		@life_points = 10 #n'est pas prit en argument dans la méthode car a une valeur fixe
	end

	def show_state
		puts "#{name} a #{life_points} points de vie" #affiche l'état d'une instance (nom + PV)
	end 

	def get_damage(damage) #permet à l'instance de perdre des PV en prenant en agrument le nobre de Pv perdus
		@life_points -= damage
			if @life_points < 0 ? @life_points = 0 : @life_points #evite les PV négatifs
			elsif@life_points == 0 
				return "Noooooon ! Le joueur #{name} a été tué !"
			else 
				return @life_points
			end 
	end 

	def attacks(target) #permet à l'instance de diminuer les Pv d'une autre instance
		puts "Le joueur #{name} attaque le joueur #{target.name}"
		hit = compute_damage #le nombre de dégats est le résultat d'un dé 6
		target.get_damage(hit) #l'instance visée reçoit les dégats du dé via la méthode précédente
		puts "Il lui inflige #{hit} points de dégats"
	end 

	 def compute_damage
    return rand(1..6) #un dé 6
  end		

end 


class HumanPlayer < Player #classe avec héritage de la classe Player 

	attr_accessor :weapon_level #on ajoute une variable 

	def initialize(name)
		@name = name
		@life_points = 100 #augmentation du nombre de PV
		@weapon_level = 1 #initialisation de la nouvelle variable
	end 

	def show_state #modification de la méthode show_state ne s'appliquant qu'à la classe HumanPlayer
		return "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level #le niveau de l'arme à une incidence sur les dégats causés
	end 

	def search_weapon #permet au joueur de changer d'arme pour une autre choisie au hasard
		found_weapon = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{found_weapon}"
		if found_weapon > @weapon_level
			@weapon_level = found_weapon
			puts "Tu as trouvé une arme plus puissante que la tienne ! Bravo, tu peux la garder !"
		else 
			puts "Bordel de merde, cette arme est moins puissante que la tienne ! Poubelle !"
			# une arme dont le niveau est supérieur à celui de celle du joueur ne peut être ramassée
		end 
	end 

	def search_health_pack
		item = rand(1..6) #recherche d'un pack de récupération de Pv basée sur un jet de dé
		if item  == 1
			puts "Tu n'as rien trouvé..."
		elsif item == (2..5)
			@life_points += 50
			@life_points > 100 ? @life_points = 100 : @life_points #les PV max sont bloqués à 100
			puts "Tu as trouvé une potion, +50 PV !"
		else 
			@life_points += 80
			@life_points > 100 ? @life_points = 100 : @life_points #les PV max sont bloqués à 100
			puts "Tu as trouvé une super potion, +80 PV !"
		end 
	end 

end 