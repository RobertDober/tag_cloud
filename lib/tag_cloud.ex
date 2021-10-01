defmodule TagCloud do
  @moduledoc """

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
  """

  defdelegate make_tag_clouds(ast, options \\ [annotation: "%tc:"]), to: TagCloud.EarmarkAst

  defdelegate make_atts_from_description(description), to: TagCloud.Compiler

  @doc """
  A convenience method to access this library's version
  """
  @spec version :: binary()
  def version do
    :application.ensure_started(:tag_cloud)
    with {:ok, version} = :application.get_key(:tag_cloud, :vsn), do: to_string(version)
  end
end
