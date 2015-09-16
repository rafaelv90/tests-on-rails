class Auction
  attr_reader :value, :started, :status

  def initialize
    @value = 0
    @status = 0
  end

  def start
    @started = Time.now
    @status = 1
  end

  def bid(inc)
    return false if (Time.now - @started) > 120
    @value += inc
  end
end
