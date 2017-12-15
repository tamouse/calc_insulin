require "calc_insulin/version"

module CalcInsulin

  CARB_EXCHANGE_RATE = 5
  LOWER_BOUND = 150
  UPPER_BOUND = 300
  SCALING = 25

  def self.run(args)
    grams = args.shift.to_i
    glucose = args.shift.to_i
    if (grams < 1 || glucose < 1)
      warn "grams or glucose not specified or less than 1, is this okay?"
      return 0
    end

    base = grams / CARB_EXCHANGE_RATE

    if glucose > UPPER_BOUND
      glocuse = UPPER_BOUND
    end

    if glucose <= LOWER_BOUND
      additional = 0
    else
      additional = (glucose - LOWER_BOUND) / SCALING
    end

    return base + additional
  end
end
