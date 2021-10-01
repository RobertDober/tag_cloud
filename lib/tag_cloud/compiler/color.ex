defmodule TagCloud.Compiler.Color do
  @predefined_colors %{
    "red" => "ff0000",
    "green" => "00ff00",
    "blue" => "0000ff"
  }

  @hex "[0-9a-fA-F]"
  @hex_color_rgx ~r<\A \# (#{@hex}{6}) \z>x
  @named_color_rgx ~r<\A (\d\d?) / (\w+) \z>x
  @simple_scale_rgx ~r<\A \d\d? \z>x
  @hex_scale_rgx ~r<\A (\d\d?) / \# (#{@hex}{6}) \z>x
  def parse_color(color) do
    try do
      cond do
        match = Regex.run(@hex_color_rgx, color) -> {nil, match |> Enum.at(1)}
        match = Regex.run(@simple_scale_rgx, color) -> {match |> hd() |> String.to_integer, "000000"}
        # TODO: Refactor next line
        match = Regex.run(@named_color_rgx, color) -> {match |> Enum.at(1) |> String.to_integer, Map.fetch!(@predefined_colors, match |> Enum.at(2))}
        match = Regex.run(@hex_scale_rgx, color) -> {match |> Enum.at(1) |> String.to_integer,  match |> Enum.at(2)}
        true -> raise TagCloud.Error, "illegal color spec #{color}"
      end
    rescue
      KeyError -> raise TagCloud.Error, "illegal color spec #{color}"
    end
  end
end
