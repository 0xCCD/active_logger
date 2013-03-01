require 'test_helper'

class ActiveLoggerTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ActiveLogger
  end
end
