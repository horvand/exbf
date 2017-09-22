defmodule ExBf.IO.ErlIO do
    @behaviour ExBf.IO

    def write(x) do
        :io.put_chars([x])
    end

    def read() do
       hd String.to_charlist :io.get_chars('', 1) 
    end

end # module
