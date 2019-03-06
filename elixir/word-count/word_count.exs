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
    |> Enum.reduce(%{}, &add_to_map/2)
  end

  defp add_to_map(value, hash) do
    Map.update(hash, value, 1, &(&1 + 1))
  end
end
