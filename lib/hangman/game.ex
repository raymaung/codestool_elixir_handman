defmodule Hangman.Game do

  defstruct(
    turns_left: 7,
    game_state: :initializing
  )

  def new_game() do
    %Hangman.Game{}
  end
end