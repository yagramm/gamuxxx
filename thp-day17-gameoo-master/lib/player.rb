class Player
  attr_accessor :name, :life_points

  def initialize (name, life_points = 10)
    @name = name
    @life_points = life_points
  end #end of initialize

  def show_state
    if self.class == HumanPlayer
      puts "Player #{@name} has #{@life_points} life points left and carries a level #{@weapon_level} weapon."
    else puts "Player #{@name} has #{@life_points} life points left and carries no weapon."
    end
  end

  def gets_damage (damage)
    @life_points -= damage
    if @life_points <= 0
      puts "+++ Player #{@name} is now dead as a doornail! +++"
      @life_points = 0
    end
  end

  def attacks (player2)
    puts "Player #{@name} now attacks #{player2.name}..."
    damage_done = compute_damage
    puts "Player #{@name} inflicts #{damage_done} damage points to player #{player2.name}!"
    player2.gets_damage(damage_done)
  end

  def compute_damage
    return rand(1..6)
  end

end #end of class Player

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name, life_points = 100, weapon_level = 1)
    @weapon_level = weapon_level
    super(name, life_points)
  end #end of initialize

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "You've found a level #{new_weapon} weapon."
    if new_weapon > @weapon_level
      puts "Great! It's more powerful than your current weapon, so you take it."
      @weapon_level = new_weapon
    else
      puts "F**k! It's less powerful than your current weapon."
    end
  end

  def search_health_pack
    new_health_pack = rand(1..6)
    if new_health_pack == 1
      puts "Sorry, you've found nothing..."
    elsif new_health_pack <= 5
      puts "Good, you've found a +50 health pack."
      @life_points + 50 > 100 ? @life_points = 100 : @life_points =+ 50
    else
      puts "Excellent! You've found a +80 health pack!"
      @life_points + 80 > 100 ? @life_points = 100 : @life_points =+ 80
    end
end

end #end of class HumanPlayer
