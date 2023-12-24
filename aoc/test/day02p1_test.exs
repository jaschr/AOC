defmodule AOCDay02Part1Test do
  use ExUnit.Case
  doctest AOC.Day02.Part1

  test "day 02 part 1" do
    assert AOC.Day02.Part1.solve("inputs/test02p1.txt") == 8

  end
end
