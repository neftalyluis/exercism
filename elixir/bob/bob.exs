defmodule Bob do
  def hey(input) do
    cond do
      silent?(input) ->
        "Fine. Be that way!"
      yelling?(input) and questioning?(input) ->
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
    if input != String.downcase(input) do
      input == String.upcase(input)
    else
      false
    end
  end

  def silent?(input) do
    String.trim(input) == ""
  end

  def questioning?(input) do
    String.ends_with?(input, "?")
  end
end
