defmodule Test.TagCloud.EarmarkAstTest do
  use ExUnit.Case

  doctest TagCloud.EarmarkAst, import: true

  import TagCloud.EarmarkAst

  describe "different annotations" do
    test "debugging doctest" do
       markdown = [
       "Elixir %%%: 12 20 800", "",
       "Erlang %%%: 10/red 2em", "",
       "Phoenix %%%: 8/sandybrown" ]

     result = markdown
       |> Earmark.as_ast!(annotations: "%%%:", inner_html: true)
       |> make_tag_clouds
       render_ast(markdown)

       expected= [
  {"p", [], ["Elixir "], %{annotation: "%%%: 12 20 800"}},
  {"p", [], ["Erlang "], %{annotation: "%%%: 10/red 2em"}},
  {"p", [], ["Phoenix "], %{annotation: "%%%: 8/sandybrown"}}
]

      assert result == expected

    end
  end
end
