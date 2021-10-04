defmodule TagCloud do
  @moduledoc ~S"""

  [![CI](https://github.com/RobertDober/tag_cloud/actions/workflows/ci.yml/badge.svg)](https://github.com/RobertDober/tag_cloud/actions/workflows/ci.yml)
  [![Coverage Status](https://coveralls.io/repos/github/RobertDober/tag_cloud/badge.svg?branch=master)](https://coveralls.io/github/RobertDober/tag_cloud?branch=master)
  [![Hex.pm](https://img.shields.io/hexpm/v/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)
  [![Hex.pm](https://img.shields.io/hexpm/dw/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)
  [![Hex.pm](https://img.shields.io/hexpm/dt/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)

  - Make Tag Cloud Styles from a simple DSL

      e.g. for HTML

        iex(1)> html_style("12 16 100")
        ~s{style="color: #000000; font-size: 16pt; font-weight: 100;"}

    This would then go perfectly into an EEx template

    ```eex
    <span <%= tc.html_style("12/peru 2em" %>>
    ```

    and the CLI will execute an `EEx` template with the variable `tc` bound to `TagCloud`


    or for an AST like [`Floki's`](https://github.com/philss/floki) or [`EarmarkParser's`](https://github.com/RobertDober/earmark_parser)

        iex(2)> ast_style("12 16 100")
        [{"style", "color: #000000; font-size: 16pt; font-weight: 100;"}]


  - Gamma correction for scaled colors

    To create 13 different shades of a color, where 0 means _transparent_ (#ffffff) and
    12 _opaque_ (original color value or #000000 as default) which are _equally_ spaced
    for the human eye we use a gamma correction of 1/2.2 which seems to work very well
    on modern screens. 

    The result for all 13 shades for some colors can be seen [here](https://htmlpreview.github.io/?https://github.com/RobertDober/tag_cloud/blob/v0.1.0/examples/gamma_correction.html)

    Right now the size of the scale and the gamma value cannot be modified but that could
    be easily implemented if desired.

    For gray shades we can indicate the color as an integer

        iex(3)> color_value(11)
        "525252"

    or a string with a default color

        iex(4)> color_value("11")
        "525252"

    or explicitly name the color

        iex(5)> color_value("11/black")
        "525252"

    or use the hex representation

        iex(6)> color_value("11/#000000")
        "525252"

        iex(7)> color_value("10/blue")
        "7171ff"

        iex(8)> color_value("10/lime")
        "71ff71"

        iex(9)> color_value("9/fuchsia")
        "ff88ff"

        iex(10)> color_value("4/medium_slate_blue") # the  _ arge ignored
        "0d16e0"

        iex(11)> color_value("8/DarkGoldenROD")  # the color name is downcased
        "8d3d89"

    But color hex values can be used too

        iex(12)> color_value("12/#d2d2d2")
        "d2d2d2"

        iex(13)> color_value("10/#d2ee0f")
        "bee65b"

  """

  defdelegate ast_style(description), to: TagCloud.Compiler
  defdelegate html_style(description), to: TagCloud.Compiler
  defdelegate color_value(description), to: TagCloud.Compiler, as: :make_color

  @doc """
  A convenience method to access this library's version

      iex(14)> {:ok, _} = Version.parse(version())
  """
  @spec version :: binary()
  def version do
    :application.ensure_started(:tag_cloud)
    with {:ok, version} = :application.get_key(:tag_cloud, :vsn), do: to_string(version)
  end
end
#  SPDX-License-Identifier: Apache-2.0
