defmodule ExBf.IO.StringIO do
@behaviour ExBf.IO
use Agent
#alias ExBf.IO.StringIO, as: SIO

	def start(input \\ "") do
		Agent.start fn -> {String.to_charlist(input), _output = ""} end, name: __MODULE__
	end

	def stop, do: Agent.stop __MODULE__

	def output do
		Agent.get __MODULE__, fn {_,o} -> o end
	end

	def input do
		Agent.get __MODULE__, fn {i,_} ->  List.to_string i end
	end

    def write(x) do
       Agent.update __MODULE__, fn {i,o} -> {i, o <> <<x>>} end
    end

    def read() do
       Agent.get_and_update __MODULE__, fn {i,o} ->
	{x, i} = case i do
		[] -> {0, []}
		[h|t] -> {h,t}
	end
	{x, {i,o}}
	end
    end

end # module
