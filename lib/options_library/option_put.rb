# Author Dan Tylenda-Emmons
# Since Feb 18, 2011
# Based on Black-Scholes forumla for pricing options

module Option
  class Put < Model

    def initialize(&blk)
      super(:put, &blk)
    end
    
  end
end