class Vampire
  @@coven = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def self.create(name, age)
    @@coven << Vampire.new(name, age)
  end
end

dracula = Vampire.create("Dracula", 450)

puts dracula.inspect
