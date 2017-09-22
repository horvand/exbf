defmodule ExBf.Parse do
	def string(s) do
		String.to_charlist(s) |> Enum.filter(&(&1 in '[],.><+-')) |> parse_list
	end

	def file(f), do: f |> File.read! |> string

	defp parse_list(l) do
		{code, []} = parse_list l, []
		code
	end

	defp parse_list([], acc), do: {Enum.reverse(acc), []}
	defp parse_list([?] | rest], acc), do: {Enum.reverse(acc), rest}
	defp parse_list([?[ | rest], acc) do
		{loop, r2} = parse_list(rest, [])
		parse_list r2, [{:loop, loop} | acc]
    end
	defp parse_list([?+ | rest], acc), do: parse_list rest, [:plus | acc]
	defp parse_list([?- | rest], acc), do: parse_list rest, [:minus | acc]
	defp parse_list([?. | rest], acc), do: parse_list rest, [:write | acc]
	defp parse_list([?, | rest], acc), do: parse_list rest, [:read | acc]
	defp parse_list([?> | rest], acc), do: parse_list rest, [:right | acc]
	defp parse_list([?< | rest], acc), do: parse_list rest, [:left | acc]

end
