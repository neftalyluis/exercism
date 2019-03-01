defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.splitter([" ", "_", ",", ":", "!", "&", "@", "$", "%", "^"], trim: true)
    |> Enum.to_list
    |> Enum.reduce(%{}, &add_to_hash/2)  end

  def add_to_hash(value, hash) do
    case Map.fetch(hash, value) do
      {:ok, qty} -> Map.put(hash, value, qty + 1)
      _ -> Map.put(hash, value, 1)
    end
  end
end
