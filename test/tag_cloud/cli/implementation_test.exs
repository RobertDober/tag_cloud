defmodule Test.TagCloud.Cli.ImplementationTest do
  use ExUnit.Case

  import TagCloud.Cli.Implementation

  describe "empty" do
    test "empty" do
      assert run([]) == {:stderr, "need a file argument"}
    end
  end

  describe "info options" do
    @usage "usage:\n\n   tag_cloud --help\n   tag_cloud --version\n   tag_cloud [ options... <file> ]\n\nevaluate an EEx template file with the local variable `tc` set to `TagCloud` for your convenience\n\n   where options can be any of:\n\n   none so far\n"
    test "--help" do
      assert run(~W[--help]) == {:stdio, @usage}
    end
    test "-h" do
      assert run(~W[-h]) == {:stdio, @usage}
    end
    test "--version" do
      {:stdio, version} = run(~W[--version])
      assert {:ok, _} = Version.parse(version)
    end
    test "-v" do
      {:stdio, version} = run(~W[-v])
      assert {:ok, _} = Version.parse(version)
    end
  end

  describe "parse a file" do
    test "simple.md" do
      file = "test/fixtures/simple.html.eex"
      result = run([file])
      expected = {:stdio, "<span style=\"color: #000000; font-size: 20pt; font-weight: 800;\">Elixir</span>\n"}
      assert result == expected
    end

    test "no such file" do
      file = "there-just-is-no-such-file.ce34x.z012"
      assert run([file]) == {:stderr, "could not read file \"there-just-is-no-such-file.ce34x.z012\": no such file or directory"}
    end
  end
end
