# frozen_string_literal: true

class Location
  attr_reader :type, :x, :y

  def initialize(x, y)
    @type = 'Point'
    @x, @y = x, y
  end

  # Converts an object of this instance into a database friendly value.
  def mongoize
    { type: @type,
      coordinates: [@x, @y] }
  end

  class << self
    # Get the object as it was stored in the database, and instantiate
    # this custom class from it.
    def demongoize(object)
      Location.new(object[0], object[1])
    end

    # Takes any possible object and converts it to how it would be
    # stored in the database.
    def mongoize(object)
      case object
      when Location then object.mongoize
      when Hash then Location.new(object[:x], object[:y]).mongoize
      else object
      end
    end

    # Converts the object that was supplied to a criteria and converts it
    # into a database friendly form.
    def evolve(object)
      case object
      when Location then object.mongoize
      else object
      end
    end
  end
end
