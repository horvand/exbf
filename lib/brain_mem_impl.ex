defmodule ExBf.Memory.Mem do

    @type cell_t :: integer
    @type t :: %__MODULE__{
        l: [cell_t],
        x: cell_t,
        r: [cell_t]
    }

    defstruct l: [], x: 0, r: [] 

    @spec new() :: t
    def new(), do: %__MODULE__{}

end # module

defimpl ExBf.Memory, for: ExBf.Memory.Mem do
    alias ExBf.Memory.Mem
    
    def left(%Mem{l: [], x: x, r: r} = m), do: %{m | x: 0, r: [x | r]}
    def left(%Mem{l: [y | l], x: x, r: r} = m), do: %{m | l: l, x: y, r: [x | r]}

    def right(%Mem{l: l, x: x, r: []} = m), do: %{m | l: [x | l], x: 0,}
    def right(%Mem{l: l, x: x, r: [y | r]} = m), do: %{m | l: [x | l], x: y, r: r}

    def plus(%Mem{x: x} = m), do: %{m | x: x + 1}

    def minus(%Mem{x: x} = m), do: %{m | x: x - 1}

    def peek(%Mem{x: x}), do: x

    def put(%Mem{} = m, x), do: %{m | x: x}

end # impl
