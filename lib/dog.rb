require 'pry'

class Dog
  # code goes here
  attr_reader :name
  attr_accessor :mood, :owner

  @@dogs = []

  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@dogs << self
  end

  def self.all
    @@dogs
  end


end


#binding.pry
