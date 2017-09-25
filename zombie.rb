class Zombie
  @@horde = []
  @@plague_level = 10

  def self.plague_level?
    @@plague_level
  end

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

  def self.all
    @@horde
  end

  def self.spawn
    number_of_zombies = rand(@@plague_level)
    puts "About to spawn #{number_of_zombies} zombies..."
    number_of_zombies.times do |zombie|
      @@horde << Zombie.new(rand( @@max_speed ), rand( @@max_strength ))
    end
  end

  def self.new_day
    self.increase_plague_level
    self.spawn
    self.some_die_off
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

  def self.some_die_off
    @@horde = @@horde.drop(rand(11))
  end
end

Zombie.spawn
puts Zombie.all.inspect

Zombie.some_die_off
puts Zombie.all.inspect
puts "Current number of zombies: #{Zombie.all.length}"

# Zombie.new_day
# puts Zombie.all.inspect
# puts "Current plague level is: #{Zombie.plague_level?}"
