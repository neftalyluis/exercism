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
    |> on_map()
  end

  def on_map(array), do: on_map(array, %{})
  def on_map([head | tail], hash), do: add_to_hash(head, tail, hash)
  def on_map([last], hash), do: add_to_hash(last, [], hash)
  def on_map([], hash), do: hash

  def add_to_hash(head, tail, hash) do
    case Map.fetch(hash, head) do
      {:ok, qty} -> on_map(tail, Map.put(hash, head, qty + 1))
      _ -> on_map(tail, Map.put(hash, head, 1))
    end
  end
end
