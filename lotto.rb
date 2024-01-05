class LotteryCard
  attr_accessor :quick_picks

  def initialize
    @quick_picks = generate_quick_picks
  end

  def generate_quick_picks
    (1..10).map { rand(1..50) }
  end
end

class LotteryDrawing
  attr_reader :winning_numbers

  def initialize
    @winning_numbers = generate_winning_numbers
  end

  def generate_winning_numbers
    (1..10).map { rand(1..50) }
  end

  def draw_winning_numbers
    puts "Drawing winning numbers..."
    @winning_numbers = generate_winning_numbers
    puts "Winning numbers: #{@winning_numbers.join(', ')}"
  end

  def check_winning(card)
    matched_numbers = card.quick_picks & @winning_numbers
    puts "Matched numbers: #{matched_numbers.join(', ')}"
    puts "Congratulations! You won!" if matched_numbers.any?
  end
end

# Example usage:
card = LotteryCard.new
puts "Your lottery card quick picks: #{card.quick_picks.join(', ')}"

drawing = LotteryDrawing.new
drawing.draw_winning_numbers

drawing.check_winning(card)

