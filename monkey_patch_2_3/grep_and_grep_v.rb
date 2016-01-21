require "minitest/autorun"
# ruby -Ilib:test grep_and_grep_v.rb

class Array

  def monkey_grep(matchable)
    self.select {|s| s.match(matchable) }
  end

  def monkey_grep_v(matchable)
    self.reject {|s| s.match(matchable) }
  end

end

describe Enumerable do
  before do
    @nested = ['hello', 'world', 'I', 'am', 'here']
  end

  describe "#monkey_grep" do
    it "returns true if a nubmer is positive" do
      @nested.monkey_grep(/l/).must_equal ['hello', 'world']
    end
  end

  describe "#monkey_grep_v" do
    it "returns true if a nubmer is positive" do
      @nested.monkey_grep_v(/l/).must_equal ['I', 'am', 'here']
    end
  end
end
