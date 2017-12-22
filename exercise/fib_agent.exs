defmodule FibAgent do
  def start do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end)
  end

  def fib(_agent, 0), do: 0
  def fib(_agent, 1), do: 1

  def fib(agent, n) do
    Agent.get_and_update(agent, fn
      cache ->
        case cache[n] do
          nil ->
            ret = fib(agent, n - 1) + fib(agent, n - 2)
            IO.inspect "ret == #{ret}"
            {ret, Map.put(cache, n, ret)}
          ret ->
            {ret, cache}
        end
    end)
  end

  # def fib(agent, 0) do
  #   0
  #   # Agent.get(agent, fn cache -> cache)
  # end
end