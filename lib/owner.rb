require 'pry'

class Owner
  # code goes here
    attr_accessor :cat, :dog
    attr_reader :species, :name


  @@owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self
    @cats = []
    @dogs = []
  end

  #INSTANCE METHODS
  def say_species
    return "I am a #{self.species}."
  end

  def cats
    @cats
  end

  def dogs
    @dogs
  end

  def buy_cat(new_cat)
    my_cat = Cat.new(new_cat, self)
    @cats << my_cat
    #binding.pry
  end

  def buy_dog(new_dog)
    my_dog = Dog.new(new_dog, self)
    @dogs << my_dog
  end


  def walk_dogs
    Dog.all.map do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end


  def feed_cats
    Cat.all.map do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end

  def sell_pets
    all_pets = Dog.all.concat(Cat.all)
    all_pets.map do |pet|
      if pet.owner == self
        pet.mood = "nervous"
        pet.owner = nil
      end
    end
  end

  def list_pets
    dog_count = 0
    cat_count = 0

    all_pets = Dog.all.concat(Cat.all)
    all_pets.map do |pet|
      if pet.owner == self && pet.class == Dog
        dog_count += 1
      elsif pet.owner == self && pet.class == Cat
        cat_count += 1
      end
    end
    return "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end




  #CLASS METHODS
  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners.clear
  end



end

#binding.pry
