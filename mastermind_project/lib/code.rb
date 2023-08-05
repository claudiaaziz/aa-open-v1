class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "pegs are invalid"
    end
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    matches = 0

    (0...guess.length).each do |i|
      matches += 1 if self[i] == guess[i]
    end
      
      matches
  end

  def num_near_matches(guess_code)
    code_dup = self.pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end

    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0

    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1 
        code_dup.delete_at(code_dup.index(peg))
      end
    end

    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
