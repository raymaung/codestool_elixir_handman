defmodule Exercise.Pythag do

  def run() do
    limit = 100
    for a <- 1..limit,
        b <- 1..limit,
        c <- 1..limit,
        (a * a) + (b * b) == (c * c) do
      {a, b, c}
    end
  end

end