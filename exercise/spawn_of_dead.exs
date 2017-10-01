defmodule SpawnOfDead do

  def inner_process do
    Process.sleep(10_000)
  end

  def outer_process do
    Process.spawn(
      fn -> SpawnOfDead.inner_process() end, []
    )
    exit(:bad)
  end

  def start do
    Enum.each(1..100, fn
      _ ->
        Process.spawn(fn -> SpawnOfDead.outer_process() end, [])
    end)
  end
end

#
# Check the process count
# > :observer.start
#
# > SpawnOfDead.start()
#
# Process Count goes up by 100. Why not 200?
# Outer process dies immediately, hence just inner_process
#