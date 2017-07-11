defmodule Exercise.Pythag do

  def run(limit \\ 100) do
    for a <- 1..limit,
        b <- (a+1)..limit,
        c <- (b+1)..limit,
        (a * a) + (b * b) == (c * c) do
      {a, b, c}
    end
  end

  def run_with_timer(limit \\ 100) do
    :timer.tc(fn -> run(limit) end) |> IO.inspect
  end

end