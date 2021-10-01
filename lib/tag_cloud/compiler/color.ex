defmodule TagCloud.Compiler.Color do
  @predefined_colors %{
    "red" => "ff0000",
    "green" => "00ff00",
    "blue" => "0000ff"
  }

  @hex "[0-9a-fA-F]"
  @hex_color_rgx ~r<\A \# (#{@hex}{8}) \z>x
  @simple_scale_rgx ~r<\A \d+ \z>x
  def parse_color(color) do
    cond do
      match = Regex.run(@hex_color_rgx, color) -> {nil, match |> tl() |> hd()}
      match = Regex.run(@simple_scale_rgx, color) -> {match |> hd() |> String.to_integer, "000000"}

    end
  end
end
