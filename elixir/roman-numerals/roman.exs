defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(integer), do: numerals(integer, "")

  def numerals(integer, state) when integer - 1000 >= 0, do: numerals(integer - 1000, state <> "M")
  def numerals(integer, state) when integer - 900 >= 0, do: numerals(integer - 900, state <> "CM")
  def numerals(integer, state) when integer - 500 >= 0, do: numerals(integer - 500, state <> "D")
  def numerals(integer, state) when integer - 400 >= 0, do: numerals(integer - 400, state <> "CD")
  def numerals(integer, state) when integer - 100 >= 0, do: numerals(integer - 100, state <> "C")
  def numerals(integer, state) when integer - 90 >= 0, do: numerals(integer - 90, state <> "XC")
  def numerals(integer, state) when integer - 50 >= 0, do: numerals(integer - 50, state <> "L")
  def numerals(integer, state) when integer - 40 >= 0, do: numerals(integer - 40, state <> "XL")
  def numerals(integer, state) when integer - 10 >= 0, do: numerals(integer - 10, state <> "X")
  def numerals(integer, state) when integer - 9 >= 0, do: numerals(integer - 9, state <> "IX")
  def numerals(integer, state) when integer - 5 >= 0, do: numerals(integer - 5, state <> "V")
  def numerals(integer, state) when integer - 4 >= 0, do: numerals(integer - 4, state <> "IV")
  def numerals(integer, state) when integer - 1 >= 0, do: numerals(integer - 1, state <> "I")
  def numerals(0, state), do: state
end
