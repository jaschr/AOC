defmodule AOC do
  @moduledoc """
  Documentation for `AOC`.

  Helper functions can be found here.

  Each day should `use AOC` and implement the `solve/1` callback.
  """

  @type path :: String.t()

  defmacro __using__(_opts) do
    quote do
      import AOC
      @behaviour AOC
      @type path :: String.t()
    end
  end

  @callback solve(path()) :: any()

  @doc """
  Returns file path contents to list of strings by line.
  """
  @spec read_file_to_list(path()) :: list(String.t())
  def read_file_to_list(file) do
    file
    |> File.stream!()
    |> Enum.to_list()
  end

  @doc """
  Returns file path contents to string.
  """
  @spec read_file_to_string(path()) :: String.t()
  def read_file_to_string(file) do
    file
    |> File.read!()
  end

  @doc """
  Removes any newline characters found within the string or list of strings.
  """
  @spec trim_newlines?((String.t() | list(String.t()))) :: (String.t() | list(String.t()))
  def trim_newlines?(string) when is_binary(string) do
    string
    |> String.replace("\r", "")
    |> String.replace("\n", "")
  end

  def trim_newlines?(list) when is_list(list) do
    list
    |> Enum.map(&trim_newlines?/1)
  end
end

