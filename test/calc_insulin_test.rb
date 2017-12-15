require 'test_helper'

class CalcInsulinTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CalcInsulin::VERSION
  end

  def test_it_returns_correct_value_for_grams
    assert_equal 8, ::CalcInsulin.run([40,1])
  end

  def test_it_returns_correct_value_for_glucose
    assert_equal 1, ::CalcInsulin.run([1,175])
  end

  def test_it_returns_larger_values
    assert_equal 15, ::CalcInsulin.run([42, 346])
  end

  def test_it_returns_zero_if_no_params
    assert_equal 0, ::CalcInsulin.run([])
  end
end
