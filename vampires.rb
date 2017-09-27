class Vampire
  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.coven_status
    @@coven
  end

  def in_coffin
    @in_coffin
  end

  def drank_blood_today
    @drank_blood_today
  end

  def in_coffin=(in_coffin)
    @in_coffin = in_coffin
  end

  def drank_blood_today=(drank_blood_today)
    @drank_blood_today = drank_blood_today
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  def self.sunrise
    @@coven = @@coven.select do |vampire|
      vampire.in_coffin && vampire.drank_blood_today
    end
  end

  def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today = false
    end
  end
end

dracula = Vampire.create("Dracula", 450)
batboy = Vampire.create("Batsy", 230)
puts dracula.inspect

Vampire.sunset
puts Vampire.coven_status.inspect

dracula.drink_blood
dracula.go_home

Vampire.sunrise
puts Vampire.coven_status.inspect
