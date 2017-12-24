
#
# Node - 1
# > iex -sname one                    # Start iex with a short node name
# > c "demo.ex"                       # Compile
# > pid = spawn Demo, :reverse, []    # Spawn Demo to receive message
# > Process.register pid, :rev1       # Register the pid with name to
# > node()                            # returns the VM fully qualified node name
#
# Node - 2
# > iex -sname two                            # Start new iex with a new name
# > Node.connect :"<Node Name Here>"          # Connect to the other node
#
# # Send a message (as tuple) to a process in different node
# > send {:rev1, :"<Node Name Here>"}, {self(), "abc"}
# > flush()
#
defmodule Demo do

  def reverse do
    receive do
      {from, msg} ->
        reversed = msg |> String.reverse
        send from, "#{inspect from}: #{msg} => #{reversed}"
        reverse()
    end
  end
end