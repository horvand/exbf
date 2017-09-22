System.argv |> hd |> ExBf.Parse.file |> ExBf.Code.exec(ExBf.Memory.Mem.new,  ExBf.IO.ErlIO)
