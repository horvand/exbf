defmodule ExBfTest do
  use ExUnit.Case
  # doctest Exbf

  test "greets the world" do
	"a" |> ExBf.Parse.file |> ExBf.Code.exec(ExBf.Memory.Mem.new,  ExBf.IO.ErlIO)
  end
end
