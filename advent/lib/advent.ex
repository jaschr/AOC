defmodule Advent do
  @moduledoc """
  # Documentation for `Advent`.

  This file provides basic helper functions for the Advent of Code 2023.

  Each day should `use Advent` and implement the `solution/1` callback.

  """

  @type day :: integer()

  defmacro __using__(_opts) do
    quote do
      import Advent
      @behaviour Advent
      @type day :: integer()
    end
  end

  @doc """
  Returns the solution for a puzzle.
  """
  @callback solution(day()) :: any()

  @spec eval_day(integer()) :: String.t()
  def eval_day(day) do
    if day < 10 do
      day
      |> Integer.to_string()
      |> String.pad_leading(2, "0")
    else
      day
      |> Integer.to_string()
    end
  end

  @doc """
  Returns the input for any given day as a list of strings.
  """
  @spec read_lines(integer()) :: list(String.t())
  def read_lines(day) do
    day_string =
      day
      |> eval_day()

    filename = "inputs/day" <> day_string <> ".txt"
    filename
    |> File.stream!()
    |> Enum.to_list()
  end
end
