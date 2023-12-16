defmodule Advent.Day02.Part1 do
  @moduledoc """
  # Documentation for `Advent.Day02.Part1`.

  Solution for *Day 02 Part 1*.
  """
  use Advent

  @bag %{red: 12, green: 13, blue: 14}

  def solution(path) do
    path
    |> read_lines()
    |> Enum.map(&String.trim/1)

  end
end

defmodule Advent.Day02.Part2 do
  @moduledoc """
  # Documentation for `Advent.Day02.Part2`.

  Solution for *Day 02 Part 2*.
  """
  use Advent

  def solution(path) do
    path
    |> read_lines()
  end
end
