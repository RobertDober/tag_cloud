defmodule TagCloud.EarmarkAst do
  use TagCloud.Types
  @moduledoc """
  An Earmark AST processor which will change annotated tag cloud paragraphs into spans with the necessary attributes
  """

  @spec make_tag_clouds(ast(), Keyword.t) :: ast()
  def make_tag_clouds(ast, options \\ [annotation: "%tc:"])
  def make_tag_clouds(ast, options) do
    options_ = Keyword.put_new(options, :annotation, "%tc:")
    ast
    |> Earmark.Transform.map_ast(&transform_annotated_paragraph(&1, Keyword.get(options, :annotation)), true)
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
    atts_ = TagCloud.make_atts_from_description(tag_cloud_description)
    {"span", Earmark.AstTools.merge_atts(atts, atts_), content, meta}
  end
end
#  SPDX-License-Identifier: Apache-2.0
