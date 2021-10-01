defmodule Test.TagCloud.Compiler.Color.ParseColorTest do
  use ExUnit.Case

  import TagCloud.Compiler.Color, only: [parse_color: 1]

  describe "gray scales" do
    test "0" do
      result = parse_color("0")
      expected = {0, "000000"}
      assert result == expected
    end
    test "1" do
      result = parse_color("1")
      expected = {1, "000000"}
      assert result == expected
    end
    test "2" do
      result = parse_color("2")
      expected = {2, "000000"}
      assert result == expected
    end
    test "3" do
      result = parse_color("3")
      expected = {3, "000000"}
      assert result == expected
    end
    test "4" do
      result = parse_color("4")
      expected = {4, "000000"}
      assert result == expected
    end
    test "5" do
      result = parse_color("5")
      expected = {5, "000000"}
      assert result == expected
    end
    test "6" do
      result = parse_color("6")
      expected = {6, "000000"}
      assert result == expected
    end
    test "7" do
      result = parse_color("7")
      expected = {7, "000000"}
      assert result == expected
    end
    test "8" do
      result = parse_color("8")
      expected = {8, "000000"}
      assert result == expected
    end
    test "9" do
      result = parse_color("9")
      expected = {9, "000000"}
      assert result == expected
    end
    test "10" do
      result = parse_color("10")
      expected = {10, "000000"}
      assert result == expected
    end
    test "11" do
      result = parse_color("11")
      expected = {11, "000000"}
      assert result == expected
    end
    test "12" do
      result = parse_color("12")
      expected = {12, "000000"}
      assert result == expected
    end
  end

end
