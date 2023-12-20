class Tile
  attr_reader :value

  def initialize(value, is_given)
    @value = value
    @is_given = is_given
  end
end
