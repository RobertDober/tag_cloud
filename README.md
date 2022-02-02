<!--
DO NOT EDIT THIS FILE
It has been generated from the template `README.md.eex` by Extractly (https://github.com/RobertDober/extractly.git)
and any changes you make in this file will most likely be lost
-->

All doctests in this README have been extracted from the code by [Extractly](https://github.com/RobertDober/extractly)
and are therefore tested

## TagCloud


[![CI](https://github.com/RobertDober/tag_cloud/actions/workflows/ci.yml/badge.svg)](https://github.com/RobertDober/tag_cloud/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/RobertDober/tag_cloud/badge.svg?branch=main)](https://coveralls.io/github/RobertDober/tag_cloud?branch=main)
[![Hex.pm](https://img.shields.io/hexpm/v/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)
[![Hex.pm](https://img.shields.io/hexpm/dw/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)
[![Hex.pm](https://img.shields.io/hexpm/dt/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)

- Make Tag Cloud Styles from a simple DSL

    e.g. for HTML

```elixir
      iex(1)> html_style("12 16 100")
      ~s{style="color: #000000; font-size: 16pt; font-weight: 100;"}
```

  This would then go perfectly into an EEx template

  ```eex
  <span <%= tc.html_style("12/peru 2em" %>>
  ```

  and the CLI will execute an `EEx` template with the variable `tc` bound to `TagCloud`


  or for an AST like [`Floki's`](https://github.com/philss/floki) or [`EarmarkParser's`](https://github.com/RobertDober/earmark_parser)

```elixir
      iex(2)> ast_style("12 16 100")
      [{"style", "color: #000000; font-size: 16pt; font-weight: 100;"}]
```


- Gamma correction for scaled colors

  To create 13 different shades of a color, where 0 means _transparent_ (#ffffff) and
  12 _opaque_ (original color value or #000000 as default) which are _equally_ spaced
  for the human eye we use a gamma correction of 1/2.2 which seems to work very well
  on modern screens. 

  The result for all 13 shades for some colors can be seen [here](https://htmlpreview.github.io/?https://github.com/RobertDober/tag_cloud/blob/v0.1.0/examples/gamma_correction.html)

  Right now the size of the scale and the gamma value cannot be modified but that could
  be easily implemented if desired.

  For gray shades we can indicate the color as an integer

```elixir
      iex(3)> color_value(11)
      "525252"
```

  or a string with a default color

```elixir
      iex(4)> color_value("11")
      "525252"
```

  or explicitly name the color

```elixir
      iex(5)> color_value("11/black")
      "525252"
```

  or use the hex representation

```elixir
      iex(6)> color_value("11/#000000")
      "525252"
```

```elixir
      iex(7)> color_value("10/blue")
      "7171ff"
```

```elixir
      iex(8)> color_value("10/lime")
      "71ff71"
```

```elixir
      iex(9)> color_value("9/fuchsia")
      "ff88ff"
```

```elixir
      iex(10)> color_value("4/medium_slate_blue") # the  _ arge ignored
      "0d16e0"
```

```elixir
      iex(11)> color_value("8/DarkGoldenROD")  # the color name is downcased
      "8d3d89"
```

  But color hex values can be used too

```elixir
      iex(12)> color_value("12/#d2d2d2")
      "d2d2d2"
```

```elixir
      iex(13)> color_value("10/#d2ee0f")
      "bee65b"
```


## TagCloud.version/0

A convenience method to access this library's version

```elixir
    iex(14)> {:ok, _} = Version.parse(version())
```


### TagCloud.Cli

usage:

    tag_cloud --help
    tag_cloud --version
    tag_cloud [ options... <file> ]

convert file from Markdown to HTML.using Earmark and allowing for TagCloud annotations

cond do

    file ends with .eex -> treat it as an EEx template

    true                -> treat file as plain markdown



### TagCloud.version/0

A convenience method to access this library's version

```elixir
    iex(14)> {:ok, _} = Version.parse(version())
```


### TagCloud.Compiler

Compiles tag cloud specifications of the form
`color font_size font_weight color` to corresponding HTML attributes

#### TagCloud.Compiler.ast_style/1

Implements the compilation

### Gray Scale

```elixir
    iex(1)> ast_style("10 12 100")
    [{"style", "color: #717171; font-size: 12pt; font-weight: 100;"}]
```

### Scale on Predefined Colors

All 140 color names defined by the CSS standard are supported.
The complete list can be found [here](https://en.wikipedia.org/wiki/Web_colors#Extended_colors)

```elixir
    iex(2)> ast_style("8/fuchsia 3em 800")
    [{"style", "color: #ff9bff; font-size: 3em; font-weight: 800;"}]
```

### Just use your own color

```elixir
    iex(3)> ast_style("12/#cafe00")
    [{"style", "color: #cafe00;"}]
```




## Author

Copyright © 2021 Robert Dober, robert.dober@gmail.com,

# LICENSE

Same as Elixir, which is Apache License v2.0. Please refer to [LICENSE](LICENSE) for details.

<!-- SPDX-License-Identifier: Apache-2.0 -->
