class Tile
  attr_reader :is_given

  def initialize(value, is_given)
    @value = value
    @is_given = is_given
  end

  def to_s
    if @value == 0
      " "
    else
      @value.to_s
    end
  end
end
