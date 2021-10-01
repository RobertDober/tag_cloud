defmodule TagCloud.Compiler do
  use TagCloud.Types

  @moduledoc """
  Compiles tag cloud specifications of the form
  `font_size font_weight color` to corresponding HTML attributes

  `color`  either a legal CSS color or an integer between 0(white) and 12(black) that
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
    cond do
      Regex.match?(@gray_scale_rgx, color) -> "##{_make_gamma_corrected_gray_scale(color)}"
      String.starts_with?(color, "#")      -> color
      true                                 -> raise TagCloud.Error, "illegal color desc #{color}, use gray scale in 0..12 or #rgb"
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

  @spec _make_gamma_corrected_gray_scale(binary()|integer()) :: binary()
  defp _make_gamma_corrected_gray_scale(gray)
  defp _make_gamma_corrected_gray_scale(gray) when is_binary(gray) do
    with {gray_, _} = Integer.parse(gray), do: _make_gamma_corrected_gray_scale(gray_)
  end

  # Can become params later, if tweaking is needed
  @gamma 1 / 2.2
  @scales 12
  defp _make_gamma_corrected_gray_scale(gray) do
    with rgbf = 255 * :math.pow((@scales - gray)/@scales, @gamma) do
      rgbf
        |> round()
        |> Integer.to_string(16)
        |> String.pad_leading(2, "00")
        |> String.duplicate(3)
        |> String.downcase
    end
  end

  @spec _make_font_weight(binary())::binary()
  defp _make_font_weight(font_weight) do
    font_weight
  end
end
