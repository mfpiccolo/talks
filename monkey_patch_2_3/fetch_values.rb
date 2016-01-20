require "minitest/autorun"
# ruby -Ilib:test numeric_positive_negative.rb

class Hash

  def monkey_fetch_values(*keys)
    keys.map do |key|
      self[key]
    end
  end

end

describe Numeric do
  describe "#monkey_fetch_values" do
    it "returns an array of values for the given keys" do
      hash = {a: 1, b: 2, c: 3, d: 4}
      hash.monkey_fetch_values(:a, :b, :c, :d).must_equal [1,2,3,4]
    end
  end
end
