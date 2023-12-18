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
    |> Enum.map(&parse_games/1)
    |> Enum.map(fn {id, draw} ->
      invalid =
        draw
        |> Enum.map(&invalid_game?(@bag, &1))
        |> Enum.any?()
      if invalid, do: 0, else: String.to_integer(id)
    end)
    |> Enum.sum()
  end

  @spec parse_games(String.t()) :: {integer(), String.t()}
  defp parse_games(line) do
    ["Game " <> id, draws] = String.split(line, ":")
    draw =
      draws
      |> String.split(";")
      |> Enum.map(&parse_draws/1)
      {id, draw}
  end

  @spec parse_draws(String.t()) :: String.t()
  defp parse_draws(draw) do
    draw
    |> String.split(",")
    |> Enum.map(&parse_colours/1)
    |> Map.new()
  end

  @spec parse_colours(String.t()) :: {String.t(), integer()}
  defp parse_colours(colours) do
    [_, count, colour] = Regex.run(~r" *(\d+) (red|green|blue) *", colours)
    {colour, String.to_integer(count)}
  end

  @spec invalid_game?(String.t(), String.t()) :: boolean()
  defp invalid_game?(bag, game) do
    Enum.any?(game, fn {key, value} ->
      case Map.fetch(bag, key) do
        {:ok, bag_value} when bag_value >= value -> false
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
