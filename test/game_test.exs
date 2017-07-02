defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game
    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "letters are in lower case a-z" do
    game = Game.new_game
    assert game.letters |> Enum.join() =~ ~r/^[a-z]+$/
  end
end
