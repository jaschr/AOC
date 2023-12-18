defmodule Advent.Day02.Part1 do
  @moduledoc """
  # Documentation for `Advent.Day02.Part1`.

  Solution for *Day 02 Part 1*.
  """
  use Advent

  @bag %{"red" => 12, "green" => 13, "blue" => 14}

  def solution(path) do
    path
    |> read_lines()
    |> Enum.map(&parse_game/1)
    |> Enum.map(fn {id, reach} ->
      invalid =
        reach
        |> Enum.map(&invalid_game?(@bag, &1))
        |> Enum.any?()

      if invalid, do: 0, else: String.to_integer(id)
    end)
    |> Enum.sum()
  end

  defp parse_reaches(reach) do
    reach
    |> String.split(",")
    |> Enum.map(fn s ->
      [_, count, colour] = Regex.run(~r" *(\d+) (red|green|blue) *", s)
      {colour, String.to_integer(count)}
    end)
    |> Map.new()
  end

  defp parse_game(line) do
   ["Game " <> id, reaches] = String.split(line, ":")
   reach =
    reaches
    |> String.split(";")
    |> Enum.map(&parse_reaches/1)

    {id, reach}
  end

  defp invalid_game?(bag, game) do
    Enum.any?(game, fn {k, v} ->
      case Map.fetch(bag, k) do
        {:ok, bag_value} when bag_value >= v -> false
        _ -> true
      end
    end)
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
