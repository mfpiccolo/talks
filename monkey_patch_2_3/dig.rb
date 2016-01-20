require "minitest/autorun"
# ruby -Ilib:test dig.rb

class Hash

  def monkey_dig(*keys)
    first_key = keys.shift
    nested_hash = self[first_key]
    if nested_hash && keys.any?
      nested_hash.monkey_dig(keys)
    else
      nested_hash
    end
    # keys.inject(self) do |last_return, key|
    #   return if last_return.empty?
    #   last_return[key]
    # end
  end

end

describe Numeric do
  describe "#monkey_dig" do
    it "returns the nested value" do
      nested = {a: {b: {c: {d: 'f'}}}}
      nested.monkey_dig(:a, :b, :c, :d).must_equal 'f'
    end
  end
end
