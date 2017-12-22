defmodule Hangman do

  def new_game() do
    Hangman.Server.start_link()
  end

  def tally(game) do
    GenServer.call(game, {:tally})
  end

  def make_move(game, guess) do
    GenServer.call(game, {:make_move, guess})
  end

end
