# Author Dan Tylenda-Emmons
# Since Feb 18, 2011
# Based on Black-Scholes forumla for pricing options

module Option
  class Call < Model

    def initialize(&blk)
      super(:call, &blk)
    end
    
  end
end