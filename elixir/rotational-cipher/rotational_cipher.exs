defmodule RotationalCipher do

  @mayus ?A..?Z
  @minus ?a..?z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn x -> add_to_codepoint(x, shift)  end)
    |> List.to_string()
  end

  def add_to_codepoint(character, shift) when character in @minus do
    add_to_codepoint(character, shift, ?a, ?z)
  end

  def add_to_codepoint(character, shift) when character in @mayus do
    add_to_codepoint(character, shift, ?A, ?Z)
  end

  def add_to_codepoint(character, shift, start_of_alphabet, end_of_alphabet) do
    case rem(shift, 26) do
      modulo when modulo == character -> character
      modulo when modulo + character > end_of_alphabet -> ((start_of_alphabet - 1) + (character + modulo - end_of_alphabet))
      modulo -> character + modulo
    end
  end

  def add_to_codepoint(character, shift) when character not in @mayus or character not in @minus, do: character
end
