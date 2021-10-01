<!--
DO NOT EDIT THIS FILE
It has been generated from the template `README.md.eex` by Extractly (https://github.com/RobertDober/extractly.git)
and any changes you make in this file will most likely be lost
-->

All doctests in this README have been extracted from the code by [Extractly](https://github.com/RobertDober/extractly)
and are therefore tested

### TagCloud.Cli

usage:

    tag_cloud --help
    tag_cloud --version
    tag_cloud [ options... <file> ]

convert file from Markdown to HTML.using Earmark and allowing for TagCloud annotations

    where options can be any of:

    none so far


### TagCloud


[![CI](https://github.com/RobertDober/tag_cloud/actions/workflows/ci.yml/badge.svg)](https://github.com/RobertDober/tag_cloud/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/RobertDober/tag_cloud/badge.svg?branch=master)](https://coveralls.io/github/RobertDober/tag_cloud?branch=master)
[![Hex.pm](https://img.shields.io/hexpm/v/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)
[![Hex.pm](https://img.shields.io/hexpm/dw/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)
[![Hex.pm](https://img.shields.io/hexpm/dt/tag_cloud.svg)](https://hex.pm/packages/tag_cloud)

Elixir Tools to create Tag clouds - Integration with Earmark Annotations - Independent Library Functions - Gamma correction for grey scales

- Earmark Integration (needs v1.4.16-pre2 or greater)

Although there are different ways the simplest way is to annotate your markdown document with tag_clouds and then render as follows

```elixir
  annotated_markdown
  |> Earmark.as_ast!
  |> TagCloud.make_tag_clouds
  |> Earmark.transform
```

### TagCloud.version/0

A convenience method to access this library's version


## Author

Copyright © 2021 Robert Dober, robert.dober@gmail.com,

# LICENSE

Same as Elixir, which is Apache License v2.0. Please refer to [LICENSE](LICENSE) for details.

<!-- SPDX-License-Identifier: Apache-2.0 -->
