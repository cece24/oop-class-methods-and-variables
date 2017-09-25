class Zombie
  @@horde = []
  @@plague_level = 10

  #following variables do not change in value
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    if speed > @@max_speed
      @speed = @@max_speed
    else
      @speed = speed
    end

    if strength > @@max_strength
      @strength = @@max_strength
    else
      @strength = strength
    end
  end

end

me_so_dead = Zombie.new(3, 6)

puts me_so_dead.inspect
