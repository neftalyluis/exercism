defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(fn x -> add_to_codepoint(x, shift)  end)
    |> List.to_string
  end

  def add_to_codepoint(character, shift) when character in ?a..?z do
    total = character + rem(shift, 25)
    IO.puts(total)
    total
  end

  def add_to_codepoint(character, shift) when character in ?A..?Z do
    total = character + rem(shift, 25)
    IO.puts(total)
    total
  end

  def add_to_codepoint(character, shift) do
    IO.puts(character)
    character
  end
end
