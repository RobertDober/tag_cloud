defmodule Test.TagCloudTest do
  use ExUnit.Case

  doctest TagCloud, import: true

  @legal_version_rgx ~r{\A \d+ \. \d+ \. \d+ }x
  test "version convenience" do
    assert Regex.match?(@legal_version_rgx, TagCloud.version)
  end
end
