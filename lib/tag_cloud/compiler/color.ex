defmodule TagCloud.Compiler.Color do
  use TagCloud.Types

  @type scaled_color_t :: {maybe(integer()), binary()}

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

  @spec parse_color(binary) :: scaled_color_t()
  def parse_color(color) do
    try do
      _parse_color!(color)
    rescue
      KeyError -> raise TagCloud.Error, "illegal color spec #{color}"
    end
  end

  @spec _hex_scale(binaries()) :: {integer(), binary()}
  defp _hex_scale([_, scale, hex]),
    do: {String.to_integer(scale), hex}

  @spec _named_scale(binaries()) :: {integer(), binary()}
  defp _named_scale([_, scale, color_name]),
    do: {String.to_integer(scale), Map.fetch!(@predefined_colors, color_name)}

  @spec _parse_color!(binary()) :: scaled_color_t()
  defp _parse_color!(color) do
    cond do
      match = Regex.run(@hex_color_rgx, color) -> {nil, match |> Enum.at(1)}
      match = Regex.run(@simple_scale_rgx, color) -> _simple_scale(match)
      match = Regex.run(@named_color_rgx, color) -> _named_scale(match)
      match = Regex.run(@hex_scale_rgx, color) -> {match |> Enum.at(1) |> String.to_integer,  match |> Enum.at(2)}
      true -> raise TagCloud.Error, "illegal color spec #{color}"
    end
  end

  @spec _simple_scale(binaries()) :: {integer(), binary()}
  defp _simple_scale([scale]), do: {String.to_integer(scale), "000000"}
end
