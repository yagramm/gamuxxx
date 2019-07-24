require 'bundler'
Bundler.require #permet d'appeler les gems contenues dans le Gemfiles

require_relative 'lib/game'
require_relative 'lib/player' #permet de lier les fichiers game et player pôur utiliser les classes et méthodes qu'ils contiennent
#permet de lier les fichiers game et player pôur utiliser les classes et méthodes qu'ils contiennent

player1 = Player.new("Josiane")
player2 = Player.new("José") #on crée deux instances de la classe Player

while player1.life_points > 0 && player2.life_points > 0 # on itère tant que l'un des joueurs n'est pas mort 

	puts "Voici l'état de chaque joueur : \n \n" 
	puts player1.show_state
	puts player2.show_state#affiche les noms et PV des joueurs
	puts "-------------------------------------------------------------" #pour faire joli :3
	puts "Passons à la phase d'attaque :"
	player1.attacks(player2) #première attaque de J1 sur J2
		if player2.life_points <= 0 
			puts "le joueur #{player2.name} a été tué"
			break #on sort de la boucle si J2 est tué (PV =0)
		end 
	player2.attacks(player1)# riposte de J2 sur J1
		if player1.life_points <= 0 
			puts "le joueur #{player1.name} a été tué"
			break #on sort de la boucle si J1 est tué (PV =0)
		end 

end


binding.pry
puts "What the fuck Felix ?!"