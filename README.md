Initial Author
--------------
Dan Tylenda-Emmons
Twitter: @CoderTrader
Email: jrubyist@gmail.com

Options Library
===============

A pure Ruby implementation of the classic Black-Scholes option model for pricing Calls or Puts.
 
Goals
-------

* Provide the Open Source Ruby, JRuby and StockTwits communities with a publicly available model for computing option prices.
* Allow users of the library to compute price and greeks: delta, gamma, theta, vega and rho.
* To aid others in the understanding of how price and sensitivities to other factors are computed on a theoretical basis.
* To allo users of the library to extend or contribute back to the project so that it may be improved upon.


Installation
-----------

    gem install options_library


Usage
-----

    require 'rubygems'
    require 'options_library'

    # Build the option out with a block builder
    call = Option::Call.new do
      underlying 95.40  # spot price of the underlying
      strike     90.5   # strike price of option
      time       0.015  # time in years
      interest   0.01   # equates to 1% risk free interest
      sigma      0.4875 # equates to 48.75% volatility
      dividend   0.05   # 5% annual dividend yield
    end

    # Values are calculated when requested
    p call.price # theoretical value of the option
    p call.delta # option price sensitivity to a change in underlying price
    p call.gamma # option delta sensitivity to a change in underlying price
    p call.vega  # option price sensitivity to a change in sigma (volatility)

    # implied volatility based on a target price
    p call.implied_vol_for_price( 1.80 )

    # Or go straight at the Calculator methods
    # Option::Calculator.price_call( underlying, strike, time, interest, sigma, dividend )
    call_price = Option::Calculator.price_call( 95.40, 90.5, 0.015, 0.01, 0.4875, 0.05 )

    # Deprecated API
    call = Option::Call.new
    call.underlying = 95.40
    call.strike = 90.00
    call.time = 0.015
    call.interest = 0.01
    call.sigma = 0.4875
    call.dividend = 0.0

    price = call.calc_price
    delta = call.calc_delta
    gamma = call.calc_gamma
    vega  = call.calc_vega

    implied_vol = call.calc_implied_vol( 1.80 )

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_options_library`)
3. Commit your changes (`git commit -am "Added Hull-White Model"`)
4. Push to the branch (`git push origin my_options_library`)
5. Create an [Issue][1] with a link to your branch
6. Enjoy a fresh cup of coffee and wait

[1]: http://github.com/github/markup/issues
