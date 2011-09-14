module Chronic
  class Quarter
    # @return [MiniDate]
    attr_reader :start

    # @return [MiniDate]
    attr_reader :end

    # @param [MiniDate] start_date
    # @param [MiniDate] end_date
    def initialize(start_date, end_date)
      @start = start_date
      @end = end_date
    end

    # @param [Symbol]  quarter  The quarter name
    # @param [Integer] pointer The direction (-1 for past, 1 for future)
    # @return [Symbol] The new quarter name
    def self.find_next_quarter(quarter, pointer)
      lookup = [:firstQuarter, :secondQuarter, :thirdQuarter, :fourthQuarter]
      next_quarter_num = (lookup.index(quarter) + 1 * pointer) % 4
      lookup[next_quarter_num]
    end

    # @param [Symbol] quarter The quarter name
    # @return [Symbol] The new quarter name
    def self.quarter_after(quarter)
      find_next_quarter(quarter, +1)
    end

    # @param [Symbol] quarter The quarter name
    # @return [Symbol] The new quarter name
    def self.quarter_before(quarter)
      find_next_quarter(quarter, -1)
    end
  end
end