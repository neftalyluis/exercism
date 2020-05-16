defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    filter(list, fun, [], true)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    filter(list, fun, [], false)
  end

  def filter([], _fun, kept, _check), do: kept
  def filter([hd | tl], fun, kept, check) do
    result = fun.(hd)

    if result == check do
      filter(tl, fun, kept ++ [hd], check)
    else
      filter(tl, fun, kept, check)
    end
  end
end
