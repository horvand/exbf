defmodule ExBf.Code do
    @type t :: [ :left | :right | :read | :write | :plus | :minus | {:loop, t} ]
    defstruct code: [], mem: %ExBf.Memory.Mem{}, io: ExBf.IO.ErlIO

    alias ExBf.Memory

    def exec(l, m, io) when is_list(l) do
	List.foldl l, m, fn x, m_in -> exec x, m_in, io end
   end

    def exec(:left,  m, _io), do: Memory.left m
    def exec(:right, m, _io), do: Memory.right m
    def exec(:plus,  m, _io), do: Memory.plus m
    def exec(:minus, m, _io), do: Memory.minus m
    def exec(:read,  m,  io), do: Memory.put m, io.read
    def exec(:write, m,  io) do
	Memory.peek(m) |> io.write
	m
    end
    def exec({:loop, loop} = l, m, io) do
	if Memory.peek(m) == 0 do
		m
	else
		m2 = exec loop, m, io
		exec l, m2, io
	end
    end

end
