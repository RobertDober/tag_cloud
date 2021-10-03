defmodule TagCloud.Compiler do
  use TagCloud.Types

  alias TagCloud.Compiler.Color

  @moduledoc """
  Compiles tag cloud specifications of the form
  `color font_size font_weight color` to corresponding HTML attributes
  """

  @doc """
  Implements the compilation

  ### Gray Scale

      iex(1)> dsl_to_attributes("10 12 100")
      [{"style", "color: #717171; font-size: 12pt; font-weight: 100;"}]

  ### Scale on Predefined Colors
  
  All 140 color names defined by the CSS standard are supported.
  The complete list can be found [here](https://en.wikipedia.org/wiki/Web_colors#Extended_colors)

      iex(2)> dsl_to_attributes("8/fuchsia 3em 800")
      [{"style", "color: #ff9bff; font-size: 3em; font-weight: 800;"}]

  ### Just use your own color

      iex(3)> dsl_to_attributes("#cafe00")
      [{"style", "color: #cafe00;"}]

  """
  @spec dsl_to_attributes(binary()) :: attributes()
  def dsl_to_attributes(description) do
    description
    |> String.split
    # TODO: remove next line when DSL gets richer
    |> Enum.take(3)
    |> _make_atts()
  end

  @spec _make_atts([binary()]) :: attributes()
  defp _make_atts(description) do
    [
      {"style",
       _make_styles(description) <> ";"}
   ]
  end

  @attributes ~W[color font-size font-weight]
  defp _make_styles(description) do
    description
    |> Enum.zip(@attributes)
    |> Enum.map(&_make_style/1)
    |> Enum.join("; ")
  end

  defp _make_style(value_style_tuple)
  defp _make_style({color, "color"}), do: "color: ##{_make_color(color)}"
  defp _make_style({font_size, "font-size"}), do: "font-size: #{_make_font_size(font_size)}"
  defp _make_style({value, key}), do: "#{key}: #{value}"

  @spec _make_color(binary()) :: binary()
  defp _make_color(color) do
    case Color.parse_color(color) do
      {nil, color_} -> color_
      {scale, color__} -> Color.gamma_corrected(scale, color__)
    end
  end

  @no_unit_rgx ~r{\A \d+ \z}x
  @spec _make_font_size(binary())::binary()
  defp _make_font_size(font_size) do
    cond do
      Regex.match?(@no_unit_rgx, font_size) -> "#{font_size}pt"
      true                                  -> font_size
    end
  end

end
