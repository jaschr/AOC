defmodule AOC.Day02.Part1 do
  @moduledoc """
  Documentation for `AOC.Day02.Part1`

  Solves the 2023 Advent of Code Day 2 Part 1 challenge.
  """

  use AOC

  @reds 12
  @greens 13
  @blues 14

  def solve(file) do
    file
    |> read_file_to_list()
    |> trim_newlines?()
    |> Enum.map(&parse_game/1)
    |> Enum.filter(fn {_id, [red: red, green: green, blue: blue]} ->
      red <= @reds && green <= @greens && blue <= @blues
    end)
    |> Enum.map(&elem(&1, 0))
    |> Enum.sum()
  end

  @spec parse_game(String.t()) :: tuple()
  defp parse_game("Game " <> game) do
    [id, round] = game |> String.split(": ")

    parsed_round =
      round
      |> String.split("; ")
      |> Enum.map(&String.split(&1, ", "))
      |> Enum.map(fn reach -> Enum.map(reach, &String.split(&1, " ")) end)
      |> Enum.map(fn reach ->
        Enum.map(reach, fn [count, colour] -> {String.to_atom(colour), String.to_integer(count)} end)
      end)

    {String.to_integer(id), [red: max_by_colour(parsed_round, :red), green: max_by_colour(parsed_round, :green), blue: max_by_colour(parsed_round, :blue)]}
  end

  @spec max_by_colour([any()], atom()) :: any()
  defp max_by_colour(round, colour) when colour in [:red, :green, :blue] do
    round
    |> Enum.max_by(&Keyword.get(&1, colour, 0))
    |> Keyword.get(colour, 0)
  end

  defp max_by_colour(_round, _colour), do: raise("Not a valid colour")
end

defmodule AOC.Day02.Part2 do
  @moduledoc """
  Documentation for `AOC.Day02.Part2`

  Solves the 2023 Advent of Code Day 2 Part 2 challenge.
  """
  use AOC

  @game_id ~r/Game (?P<game_id>\d+)/
  @matches ~r/\d+\sred|\d+\sgreen|\d+\sblue/
  
  def solve(file) do
    file
    |> read_file_to_list()
    |> trim_newlines?()
    |> Enum.map(fn cube ->
      [[_whole, game_id]] = Regex.scan(@game_id, cube)
      matches = Regex.scan(@matches, cube)

      colours =
        Enum.reduce(matches, %{}, fn [match], acc ->
          [num, colour] = String.split(match)
          num_int = String.to_integer(num)

          Map.update(acc, colour, num_int, &Enum.max([num_int, &1]))
        end)

      {String.to_integer(game_id), colours}
    end)
    |> Enum.map(fn {_game_id, colours} ->
      Map.get(colours, "red", 1) * Map.get(colours, "green", 1) * Map.get(colours, "blue", 1)
    end)
    |> Enum.map(fn cube -> cube end)
    |> Enum.sum()
  end
end

