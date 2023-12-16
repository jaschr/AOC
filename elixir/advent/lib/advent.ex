defmodule Advent do
  @moduledoc """
  # Documentation for 'Advent'.

  This file provides basic helper functions for the Advent of Code 2023.

  Each day should 'use AOC' and implement the 'solution/1' callback.
  """

  @type path :: String.t()

  defmacro __using__(_opts) do
    quote do
      import Advent
      @behaviour Advent
      @type path :: String.t()
    end
  end

  @doc """
  Returns the solution for a puzzle.
  """
  @callback solution(path()) :: any()

  @doc """
  Returns the input for any given day as a list of strings.
  """
  @spec read_lines(path()) :: list(String.t())
  def read_lines(filename) do
    filename
    |> File.stream!()
    |> Enum.to_list()
  end
end
