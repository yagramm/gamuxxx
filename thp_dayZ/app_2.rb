require 'bundler'
Bundler.require 
#on appelle les gems du bundle install

require_relative 'lib/game'
require_relative 'lib/player' 
#on lie les fichiers contenant les classes 

puts " \t ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n \t Bienvenue sur ''Ils veulent tous ma POO'' \n \t Qui sera le dernier survivant ? \n \t ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

puts "Quel est ton prénom ?"
firstname = gets.chomp.to_s

user = HumanPlayer.new("#{firstname}")
player1 = Player.new("Josiane")
player2 = Player.new("José") 
#on crée deux instances de classe Player qui seront les bots et une instance de la classe HumanPlayer qui sera le joueur

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) 
# on itère tant que le joueur à des PV et tant que tous les bots ne sont pas morts
	
	puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n Voici l'état de #{user.name} : \n#{user.show_state} \n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	#on donne le nom + PV du joueur
	gets.chomp

	puts "Quelle action veux-tu effectuer ? \n\n a - chercher une meilleure arme \n s - chercher une potion de soin \n\n Attaquer un joueur en vue \n\n 0 - #{player2.name} a #{player2.life_points} PV \n 1 - #{player1.name} a #{player1.life_points} PV"
	#on présente au joueur les choix qui lui sont offerts et l'état des ennemis
	action = gets.chomp 
	# la méthode correspondant est appelée en fonction de l'imput du joueur. Si il n'entre pas de commande valide, il passe son tour.
	if action == "a" 
		user.search_weapon
	elsif action == "s" 
		user.search_health_pack
	elsif action == "0"
		user.attacks(player2)
	elsif action == "1"
		user.attacks(player1)
	else
		puts "Tu passe ton tour, essaie d'entrer une commande valide"
	end 

	puts "Attention ! Les ennemis t'attaquent !"

	enemies = [player1, player2]

	enemies.each do |enemy| #chaque ennemi attaque sauf si ses PV = 0 
		if enemy.life_points > 0
			enemy.attacks(user)
		else 
			puts "#{enemy.name} est mort, il ne peut pas attaquer !"	
		end 
	end

end 

puts "\n~~ La partie est finie ~~\n "

if user.life_points > 0
	puts "~~ BRAVO ! Tu as gagné ~~" 
	# si les PV du joueur sont positifs à la sortie de la boucle, il gagne la partie
else 
	puts "~~ Bouh ! Tu as perdu ! ~~"
end 

binding.pry
p "What the fuck Felix ?!"