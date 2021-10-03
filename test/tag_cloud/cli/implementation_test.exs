defmodule Test.TagCloud.Cli.ImplementationTest do
  use ExUnit.Case

  import TagCloud.Cli.Implementation

  describe "empty" do
    test "empty" do
      assert run([]) == {:stderr, "need a file argument"}
    end
  end

  describe "info options" do
    @usage """
    usage:

       tag_cloud --help
       tag_cloud --version
       tag_cloud [ options... <file> ]

    convert file from Markdown to HTML.using Earmark and allowing for TagCloud annotations

       where options can be any of:

       none so far
    """
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
      file = "test/fixtures/simple.md"
      result = run([file])
      expected = {:stdio, TagCloud.render_html(File.read!(file))}
      assert result == expected
    end

    test "no such file" do
      file = "there-just-is-no-such-file.ce34x.z012"
      assert run([file]) == {:stderr, "could not stream \"there-just-is-no-such-file.ce34x.z012\": no such file or directory"}
    end
  end
end
