defmodule Advent.Day01.Part1 do
  @moduledoc """
  # Documentation for `Advent.Day01.Part1`.

  Solution for *Day 01 Part 1*.
  """
  use Advent

  def solution(path) do
    path
    |> read_lines()
    |> Enum.map(&calibration_value/1)
    |> Enum.sum()
  end

  @spec calibration_value(String.t()) :: integer()
  def calibration_value(line) do
    line
    |> String.trim()
    |> String.replace(~r/[^\d]/, "", global: true)
    |> first_and_last()
    |> String.to_integer()
  end

  @spec first_and_last(String.t()) :: String.t()
  def first_and_last(line) do
    "#{String.first(line)}#{String.last(line)}"
  end
end

defmodule Advent.Day01.Part2 do
  @moduledoc """
  # Documentation for `Advent.Day01.Part2`.

  Solution for *Day 01 Part 2*.
  """
  use Advent

  @digit "[[:digit:]]"
  @mapping %{
    "zero" => 0,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9
  }
  @matching Regex.compile!("(?=(" <> @digit <> "|" <> Enum.join(Map.keys(@mapping), "|") <> "))")

  def solution(path) do
    path
    |> read_lines()
    |> Enum.map(&calibration_value/1)
    |> Enum.sum()
  end

  @spec calibration_value(String.t()) :: integer()
  def calibration_value(line) do
    line
    |> String.trim()
    |> words_to_digits()
    |> first_and_last()
    |> String.to_integer()
  end

  @spec first_and_last(String.t()) :: String.t()
  def first_and_last(line) do
    "#{String.first(line)}#{String.last(line)}"
  end

  @spec words_to_digits(String.t()) :: String.t()
  def words_to_digits(line) do
    Regex.scan(@matching, line, capture: :all_but_first)
    |> List.flatten()
    |> Enum.map(&number_to_digit/1)
    |> Enum.join()
  end

  @spec number_to_digit(integer()) :: integer()
  def number_to_digit(number) do
    Map.get(@mapping, number, number)
  end
end
