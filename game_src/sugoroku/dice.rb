class Dice
  def initialize(sides)
    @sides = Range.new(1, sides)
  end

  def roll
    outcome = rand(@sides)
  end
end
