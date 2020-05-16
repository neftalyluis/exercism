defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(integer), do: numeral(integer, "")

  def numeral(integer, state) when integer - 1000 >= 0, do: numeral(integer - 1000, state <> "M")
  def numeral(integer, state) when integer - 900 >= 0, do: numeral(integer - 900, state <> "CM")
  def numeral(integer, state) when integer - 500 >= 0, do: numeral(integer - 500, state <> "D")
  def numeral(integer, state) when integer - 400 >= 0, do: numeral(integer - 400, state <> "CD")
  def numeral(integer, state) when integer - 100 >= 0, do: numeral(integer - 100, state <> "C")
  def numeral(integer, state) when integer - 90 >= 0, do: numeral(integer - 90, state <> "XC")
  def numeral(integer, state) when integer - 50 >= 0, do: numeral(integer - 50, state <> "L")
  def numeral(integer, state) when integer - 40 >= 0, do: numeral(integer - 40, state <> "XL")
  def numeral(integer, state) when integer - 10 >= 0, do: numeral(integer - 10, state <> "X")
  def numeral(integer, state) when integer - 9 >= 0, do: numeral(integer - 9, state <> "IX")
  def numeral(integer, state) when integer - 5 >= 0, do: numeral(integer - 5, state <> "V")
  def numeral(integer, state) when integer - 4 >= 0, do: numeral(integer - 4, state <> "IV")
  def numeral(integer, state) when integer - 1 >= 0, do: numeral(integer - 1, state <> "I")
  def numeral(0, state), do: state
end
