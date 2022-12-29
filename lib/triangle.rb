require 'pry'

class Triangle
  # write code here
  attr_accessor :one, :two, :three

  def initialize(one, two, three)
    @one = one
    @two = two
    @three = three
    @sides = []
    @sides.push(one, two, three)
    #binding.pry
    @sides.filter do |i|
      if i <= 0
        raise TriangleError
      end
    end
    if one + two <= three
      raise TriangleError
    elsif one + three <= two
      raise TriangleError
    elsif two + three <= one
      raise TriangleError
    end
  end

  def kind
    #binding.pry
    if @sides.uniq.length == 1
      return :equilateral
    elsif @sides.uniq.length == 2
      return :isosceles
    elsif @sides.uniq.length == 3
      return :scalene
    end
  end
  
  class TriangleError < StandardError
  end
end
