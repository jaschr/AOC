defmodule AOCTest do
  use ExUnit.Case
  doctest AOC

  test "day 1 part 1" do
    assert AOC.Day1.Part1.solve("inputs/test01.txt") == 142
  end
end
