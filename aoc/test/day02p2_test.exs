defmodule AOCDay02Part2Test do
  use ExUnit.Case
  doctest AOC.Day02.Part2

  test "day 02 part 2" do
    assert AOC.Day02.Part2.solve("inputs/test02p2.txt") == 2286

  end
end
