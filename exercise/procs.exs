defmodule Procs do
  def greeter(count) do
    receive do
      {:boom, reason} ->
        exit(reason)
      {:add, n} ->
        greeter(count + n)
      {:reset} ->
        greeter(0)
      msg ->
        IO.puts "#{count}: Hello #{inspect msg}"
        greeter(count)
    end
  end
end

# pid = spawn Procs, :greeter, [0]
# send pid, "John Smith"

#
# Linking to the parent process
#
# pid = spawn_link Procs, :greeter, [0]
# send pid, {:boom, "Invalid Reason"}
# send pid, {:boom, :normal}
