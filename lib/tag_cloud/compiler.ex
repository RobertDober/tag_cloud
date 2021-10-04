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

      iex(1)> ast_style("10 12 100")
      [{"style", "color: #717171; font-size: 12pt; font-weight: 100;"}]

  ### Scale on Predefined Colors
  
  All 140 color names defined by the CSS standard are supported.
  The complete list can be found [here](https://en.wikipedia.org/wiki/Web_colors#Extended_colors)

      iex(2)> ast_style("8/fuchsia 3em 800")
      [{"style", "color: #ff9bff; font-size: 3em; font-weight: 800;"}]

  ### Just use your own color

      iex(3)> ast_style("#cafe00")
      [{"style", "color: #cafe00;"}]

  """
  @spec ast_style(binary()) :: attributes()
  def ast_style(description) do
    description
    |> String.split
    # TODO: remove next line when DSL gets richer
    |> Enum.take(3)
    |> _make_atts()
  end

  @spec html_style(binary()) :: binary()
  def html_style(description) do
    description
    |> ast_style()
    |> hd()
    |> _make_html()
  end

  @spec _make_atts([binary()]) :: attributes()
  defp _make_atts(description) do
    [
      {"style",
       _make_styles(description) <> ";"}
   ]
  end

  @spec make_color(binary()) :: binary()
  def make_color(color) do
    case Color.parse_color(color) do
      {nil, color_} -> color_
      {scale, color__} -> Color.gamma_corrected(scale, color__)
    end
  end

  @spec _make_html(attribute()) :: binary()
  defp _make_html(ast)
  defp _make_html({key, value}) do
    ~s{#{key}="#{value}"}
  end

  @attributes ~W[color font-size font-weight]
  defp _make_styles(description) do
    description
    |> Enum.zip(@attributes)
    |> Enum.map(&_make_style/1)
    |> Enum.join("; ")
  end

  defp _make_style(value_style_tuple)
  defp _make_style({color, "color"}), do: "color: ##{make_color(color)}"
  defp _make_style({font_size, "font-size"}), do: "font-size: #{_make_font_size(font_size)}"
  defp _make_style({value, key}), do: "#{key}: #{value}"

  @no_unit_rgx ~r{\A \d+ \z}x
  @spec _make_font_size(binary())::binary()
  defp _make_font_size(font_size) do
    cond do
      Regex.match?(@no_unit_rgx, font_size) -> "#{font_size}pt"
      true                                  -> font_size
    end
  end

end
