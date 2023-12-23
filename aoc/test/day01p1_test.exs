
defmodule AOCDay01Part1Test do
  use ExUnit.Case
  doctest AOC.Day01.Part1

  test "day 01 part 1" do
    assert AOC.Day01.Part1.solve("inputs/test01p1.txt") == 142

  end
end
