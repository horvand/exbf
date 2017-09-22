defmodule ExBf.IO do

    @type t :: any
    @type ok :: :ok

    @callback write(t) :: ok

    @callback read() :: t

end
