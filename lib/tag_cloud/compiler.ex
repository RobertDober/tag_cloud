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

  ### Grey Scale

      iex(0)> make_atts_from_description("10 12 100")
      [{"style", "color: #717171; font-size: 12pt; font-weight: 100;"}]
  """
  @spec make_atts_from_description(binary()) :: attributes()
  def make_atts_from_description(description) do
    "#{description} 12 600"
    |> String.split
    |> Enum.take(3)
    |> _make_atts()
  end

  @spec _make_atts([binary()]) :: attributes()
  defp _make_atts([color, font_size, font_weight]) do
    [
      {"style",
       ["color: #{_make_color(color)};",
        "font-size: #{_make_font_size(font_size)};",
        "font-weight: #{_make_font_weight(font_weight)};"
      ] |> Enum.join(" ")}
  ]
  end

  @gray_scale_rgx ~r{\A \d\d? \z}x

  @spec _make_color(binary()) :: binary()
  defp _make_color(color) do
    {scale, base_color} = Color.parse_color(color)
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

  defp _make_gamma_corrected_octet(scale, color) do
    inv_c = 255 - _decimal_octet_value(color)
    with scaled <- inv_c * :math.pow((@scales - scale)/@scales, @gamma) do
      scaled
        |> round()
        |> Integer.to_string(16)
        |> String.pad_leading(2, "00")
    end
  end

  @spec _make_font_weight(binary())::binary()
  defp _make_font_weight(font_weight) do
    font_weight
  end

  @spec _decimal_octet_value(binary()) :: integer()
  defp _decimal_octet_value(color) do
    with {c,""} <- Integer.parse(color), do: c
  end

end
