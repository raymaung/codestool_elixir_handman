defmodule Procs do
  def greeter do
    receive do
      msg -> IO.puts "Hello #{inspect msg}"
    end
    greeter()
  end
end

# pid = spawn Procs, :greeter, []
# send pid, "John Smith"