defmodule Bob do
  def hey(input) do
    cond do
      silent?(input) ->
        "Fine. Be that way!"
      yelling?(input) && questioning?(input) ->
        "Calm down, I know what I'm doing!"
      yelling?(input) ->
        "Whoa, chill out!"
      questioning?(input) ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  def yelling?(input) do
    if letters?(input) do
      input == String.upcase(input)
    end
  end

  def silent?(input) do
    input
    |> String.split
    |> Enum.count == 0
  end

  def questioning?(input) do
    String.ends_with?(input, "?")
  end

  def letters?(input) do
    String.match?(input, ~r/\p{L}/)
  end
end
