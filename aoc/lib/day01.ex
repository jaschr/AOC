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

  @nums %{
    "zero" => 0,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
  }

  @regex_with_words Regex.compile!("(?=(zero|one|two|three|four|five|six|seven|eight|nine|\\d))")

  def solve(file) do
    file
    |> read_file_to_list()
    |> trim_newlines?()
    |> Enum.map(&recalibrate/1)
    |> Enum.sum()
  end

  @spec recalibrate(String.t()) :: integer()
  def recalibrate(line) do
    line
    |> remove_non_numbers()
    |> first_and_last_digit()
    |> String.to_integer()
  end

  @spec remove_non_numbers(String.t()) :: String.t()
  defp remove_non_numbers(line) do
    Regex.scan(@regex_with_words, line, capture: :all_but_first)
    |> List.flatten()
    |> Enum.map(&mapping_to_digit/1)
    |> Enum.join()
  end

  def mapping_to_digit(number) do
    Map.get(@nums, number, number)
  end

  @spec first_and_last_digit(String.t()) :: String.t()
  defp first_and_last_digit(line) do
    "#{String.first(line)}#{String.last(line)}"
  end
end
