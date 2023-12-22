defmodule AOC.Day1.Part1 do
  @moduledoc """
  Documentation for `AOC.Day1.Part1`

  Solves the 2023 Advent of Code Day 1 Part 1 challenge.
  """

  use AOC

  def solve(file) do
    file
    |> read_file_to_list()
    |> trim_newlines?()
    |> Enum.map(&recalibrate/1)
    |> Enum.sum()
  end

  @spec recalibrate(String.t()) :: integer()
  defp recalibrate(line) do
    line
    |> remove_non_digits()
    |> first_and_last_digit()
    |> String.to_integer()
  end

  @spec remove_non_digits(String.t()) :: String.t()
  defp remove_non_digits(line) do
    line
    |> String.replace(~r/[^\d]/, "")
  end

  @spec first_and_last_digit(String.t()) :: String.t()
  defp first_and_last_digit(line) do
    "#{String.first(line)}#{String.last(line)}"
  end
end


defmodule AOC.Day1.Part2 do
  @moduledoc """
  Documentation for `AOC.Day1.Part2`

  Solves the 2023 Advent of Code Day 1 Part 2 challenge.
  """

  use AOC

  def solve(file) do

  end
end
