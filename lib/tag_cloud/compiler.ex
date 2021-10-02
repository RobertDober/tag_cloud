defmodule TagCloud.Compiler do
  use TagCloud.Types

  alias TagCloud.Compiler.Color

  @moduledoc """
  Compiles tag cloud specifications of the form
  `font_size font_weight color` to corresponding HTML attributes

  `color`  either a legal CSS color or an integer between 0(transparent) and 12(opaque) that can be followed by a /css_color
  `font_size` is an integer in `pt`
  `font_weight` an integer between 0 and 800
  matches to 13 gamma corrected shades of grey (yes only 13, a bigger number, let's pick
  randomly a number, say 50 shades of grey could not be very well distinguished)
  """

  @doc """
  Implements the compilation

  ### Gray Scale

      iex(0)> dsl_to_attributes("10 12 100")
      [{"style", "color: #717171; font-size: 12pt; font-weight: 100;"}]
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
      color__ -> _make_gamma_corrected_color(color__)
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

  defp _make_gamma_corrected_color(color)

  # Can become params later, if tweaking is needed
  @gamma 1 / 2.2
  @scales 12
  @parse_color_rgx ~r{\A (..) (..) (..) \z}x
  defp _make_gamma_corrected_color({scale, base_color}) do
    Regex.run(@parse_color_rgx, base_color)
    |> tl()
    |> Enum.map(&_make_gamma_corrected_octet(scale, &1))
    |> Enum.join
    |> String.downcase
  end

  defp _make_gamma_corrected_octet(scale, octet) do
    IO.puts octet
    inv_c = 255 - String.to_integer(octet, 16)
    with scaled <- 255 - inv_c * :math.pow((@scales - scale)/@scales, @gamma) do
      scaled
        |> round()
        |> Integer.to_string(16)
        |> String.pad_leading(2, "00")
    end
  end
end
