require 'pry'

class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    return @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def say_species
    return "I am a #{self.species}."
  end

  def pets
    @pets
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood= "happy"
    end
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood= "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood= "happy"
    end
  end

  def sell_pets
    @pets.each do |key, value|
        value.each do |pet|
        pet.mood= "nervous"
      end
      pets[key].clear
    end
  end

  def list_pets
      return "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

end
