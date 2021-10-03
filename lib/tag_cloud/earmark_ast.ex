defmodule TagCloud.EarmarkAst do
  use TagCloud.Types
  @moduledoc ~S"""
  An Earmark AST processor which will change annotated tag cloud paragraphs into spans with the necessary attributes

  Needs Earmark version 1.4.16-pre2 or later

  E.g.

      iex(1)> markdown = [
      ...(1)> "Elixir %tc: 10/blue 18 800", "",
      ...(1)> "Ruby %tc: 4/red 10 100"]
      ...(1)> render_html(markdown)
      "<span style=\"color: #7171ff; font-size: 18pt; font-weight: 800;\">\nElixir </span>\n<span style=\"color: #ffd4d4; font-size: 10pt; font-weight: 100;\">\nRuby </span>\n"

  """
  @annotation "%tc:"
  @spec make_tag_clouds(ast(), Keyword.t) :: ast()
  def make_tag_clouds(ast, options \\ [annotation: @annotation])
  def make_tag_clouds(ast, options) do
    options_ = Keyword.put_new(options, :annotation, @annotation)
    ast
    |> Earmark.Transform.map_ast(&transform_annotated_paragraph(&1, Keyword.get(options_, :annotation)), true)
  end

  @spec render_ast(IO.chardata) :: ast()
  def render_ast(markdown) do
    markdown
    |> Earmark.as_ast!(annotations: @annotation, inner_html: true)
    |> make_tag_clouds()
  end

  @spec render_html(IO.chardata) :: binary()
  def render_html(markdown) do
    markdown
    |> render_ast()
    |> Earmark.transform
  end

  @spec transform_annotated_paragraph(ast_node(), binary()) :: ast_node()
  defp transform_annotated_paragraph(node, annotation)
  defp transform_annotated_paragraph({_, _, _, meta}=node, annotation) do
    case Map.get(meta, :annotation) do
      nil -> node
      annotation_ ->
        if String.starts_with?(annotation_, annotation) do
          annotate_node(node, String.replace(annotation_, annotation, "", global: false))
        else
          node
        end
    end
  end

  @spec annotate_node(ast_node(), binary()) :: ast_node()
  defp annotate_node({_, atts, content, meta}, tag_cloud_description) do
    atts_ = TagCloud.dsl_to_attributes(tag_cloud_description)
    {"span", Earmark.AstTools.merge_atts(atts, atts_), content, meta}
  end
end
#  SPDX-License-Identifier: Apache-2.0
