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
    # solution 1: drop the first n number of objects from array
    # @@horde = @@horde.drop(rand(11))

    zombies_to_delete = @@horde.sample(rand(11))
    @@horde -= zombies_to_delete
  end

  def encounter
    outrun = self.outrun_zombie?
    survive = self.survive_attack?
    # escape unscathed
    if outrun
      puts "You escaped unscathed!"
    elsif survive
      puts "You've become a zombie!"
      @@horde << Zombie.new(rand( @@max_speed ), rand( @@max_strength ))
    else
      puts "You were killed by the zombie!"
    end
    # killed by zombie_opponent

    # catching plague and becoming zombie

  end

  def speed
    @speed
  end

  def strength
    @strength
  end

  def outrun_zombie?
    my_speed = rand(@@max_speed)
    puts "My speed is: #{my_speed} vs zombie speed of #{self.speed}"

    if my_speed > self.speed
      outrun = true
    else
      outrun = false
    end
  end

  def survive_attack?
    my_strength = rand(@@max_strength)
    puts "My strength is #{my_strength} vs zombie strength of #{self.strength}"

    if my_strength > self.strength
      survive = true
    else
      survive = false
    end
  end
end

Zombie.spawn
puts Zombie.all.inspect

# Zombie.some_die_off
# puts Zombie.all.inspect
# puts "Current number of zombies: #{Zombie.all.length}"

# Zombie.new_day
# puts Zombie.all.inspect
# puts "Current plague level is: #{Zombie.plague_level?}"

puts "There are #{Zombie.all.length} zombies."
zombie1 = Zombie.all[0]
puts "This is the zombie you're encountering #{zombie1.inspect}"
zombie1.encounter
puts "There are now #{Zombie.all.length} zombies."
