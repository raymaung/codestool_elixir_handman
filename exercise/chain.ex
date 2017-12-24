#
# Node-1
# > iex --sname one chain.ex
#
# Node-2
# > iex --sname two chain.ex
#
# Node-1
# > Chain.start_link "<Node-2>"
#
# Node-2
# > Chain.start_link "<Node-1>"
#
# Node-1
# > send :chainer, {:trigger, [] }
#
defmodule Chain do

  defstruct(
    next_node: nil,
    count: 4
  )

  def start_link(next_node) do
    spawn_link(Chain, :message_loop, [%Chain{next_node: next_node}])
    |> Process.register(:chainer)
  end

  def message_loop(%{count: 0}) do
    IO.inspect "== DONE =="
  end

  def message_loop(state) do
    receive do
      {:trigger, list} ->
        IO.inspect list
        IO.inspect "======================"
        :timer.sleep(500)
        send {:chainer, state.next_node}, {:trigger, [node() | list]}
        message_loop %{state | count: state.count - 1}
    end
  end
end