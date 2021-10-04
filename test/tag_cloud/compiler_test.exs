defmodule Test.TagCloud.CompilerTest do
  use ExUnit.Case

  import TagCloud.Compiler
  doctest TagCloud.Compiler, import: true

  describe "html_style" do
    test "12 16 100" do
      dsl = "12 16 100"
      expected = "style=\"color: #000000; font-size: 16pt; font-weight: 100;\""
      assert html_style(dsl) == expected
    end
  end
end
