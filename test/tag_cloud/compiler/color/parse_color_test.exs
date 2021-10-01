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

  describe "red scales" do
    test "0" do
      result = parse_color("0/red")
      expected = {0, "ff0000"}
      assert result == expected
    end

    test "1" do
      result = parse_color("1/red")
      expected = {1, "ff0000"}
      assert result == expected
    end

    test "2" do
      result = parse_color("2/red")
      expected = {2, "ff0000"}
      assert result == expected
    end

    test "3" do
      result = parse_color("3/red")
      expected = {3, "ff0000"}
      assert result == expected
    end

    test "4" do
      result = parse_color("4/red")
      expected = {4, "ff0000"}
      assert result == expected
    end

    test "5" do
      result = parse_color("5/red")
      expected = {5, "ff0000"}
      assert result == expected
    end

    test "6" do
      result = parse_color("6/red")
      expected = {6, "ff0000"}
      assert result == expected
    end

    test "7" do
      result = parse_color("7/red")
      expected = {7, "ff0000"}
      assert result == expected
    end

    test "8" do
      result = parse_color("8/red")
      expected = {8, "ff0000"}
      assert result == expected
    end

    test "9" do
      result = parse_color("9/red")
      expected = {9, "ff0000"}
      assert result == expected
    end

    test "10" do
      result = parse_color("10/red")
      expected = {10, "ff0000"}
      assert result == expected
    end

    test "11" do
      result = parse_color("11/red")
      expected = {11, "ff0000"}
      assert result == expected
    end

    test "12" do
      result = parse_color("12/red")
      expected = {12, "ff0000"}
      assert result == expected
    end
  end

  describe "green scales" do
    test "0" do
      result = parse_color("0/green")
      expected = {0, "00ff00"}
      assert result == expected
    end

    test "1" do
      result = parse_color("1/green")
      expected = {1, "00ff00"}
      assert result == expected
    end

    test "2" do
      result = parse_color("2/green")
      expected = {2, "00ff00"}
      assert result == expected
    end

    test "3" do
      result = parse_color("3/green")
      expected = {3, "00ff00"}
      assert result == expected
    end

    test "4" do
      result = parse_color("4/green")
      expected = {4, "00ff00"}
      assert result == expected
    end

    test "5" do
      result = parse_color("5/green")
      expected = {5, "00ff00"}
      assert result == expected
    end

    test "6" do
      result = parse_color("6/green")
      expected = {6, "00ff00"}
      assert result == expected
    end

    test "7" do
      result = parse_color("7/green")
      expected = {7, "00ff00"}
      assert result == expected
    end

    test "8" do
      result = parse_color("8/green")
      expected = {8, "00ff00"}
      assert result == expected
    end

    test "9" do
      result = parse_color("9/green")
      expected = {9, "00ff00"}
      assert result == expected
    end

    test "10" do
      result = parse_color("10/green")
      expected = {10, "00ff00"}
      assert result == expected
    end

    test "11" do
      result = parse_color("11/green")
      expected = {11, "00ff00"}
      assert result == expected
    end

    test "12" do
      result = parse_color("12/green")
      expected = {12, "00ff00"}
      assert result == expected
    end
  end

  describe "blue scales" do
    # <%= for i <- 0..12 do %>
    # test "<%= i %>" do
    #   result = parse_color("<%= i %>/blue")
    #   expected = {<%= i %>, "0000ff"}
    #   assert result == expected
    # end
    # <% end %>

    test "0" do
      result = parse_color("0/blue")
      expected = {0, "0000ff"}
      assert result == expected
    end

    test "1" do
      result = parse_color("1/blue")
      expected = {1, "0000ff"}
      assert result == expected
    end

    test "2" do
      result = parse_color("2/blue")
      expected = {2, "0000ff"}
      assert result == expected
    end

    test "3" do
      result = parse_color("3/blue")
      expected = {3, "0000ff"}
      assert result == expected
    end

    test "4" do
      result = parse_color("4/blue")
      expected = {4, "0000ff"}
      assert result == expected
    end

    test "5" do
      result = parse_color("5/blue")
      expected = {5, "0000ff"}
      assert result == expected
    end

    test "6" do
      result = parse_color("6/blue")
      expected = {6, "0000ff"}
      assert result == expected
    end

    test "7" do
      result = parse_color("7/blue")
      expected = {7, "0000ff"}
      assert result == expected
    end

    test "8" do
      result = parse_color("8/blue")
      expected = {8, "0000ff"}
      assert result == expected
    end

    test "9" do
      result = parse_color("9/blue")
      expected = {9, "0000ff"}
      assert result == expected
    end

    test "10" do
      result = parse_color("10/blue")
      expected = {10, "0000ff"}
      assert result == expected
    end

    test "11" do
      result = parse_color("11/blue")
      expected = {11, "0000ff"}
      assert result == expected
    end

    test "12" do
      result = parse_color("12/blue")
      expected = {12, "0000ff"}
      assert result == expected
    end
  end

  describe "miscelaneous scales" do
    # <%= for {i, j} <- [{0, "dfec0a"}, {3, "010203"}, {12, "f0f0da"}]  do %>
    # test "<%= i %>" do
    #   result = parse_color("<%= i %>/#<%= j %>")
    #   expected = {<%= i %>, "<%= j %>"}
    #   assert result == expected
    # end
    # <% end %>

    test "0" do
      result = parse_color("0/#dfec0a")
      expected = {0, "dfec0a"}
      assert result == expected
    end

    test "3" do
      result = parse_color("3/#010203")
      expected = {3, "010203"}
      assert result == expected
    end

    test "12" do
      result = parse_color("12/#f0f0da")
      expected = {12, "f0f0da"}
      assert result == expected
    end
  end

  describe "illegal spex" do
    # <%= for illegal <- ["", "23/", "#abcdeg", "#aaaaa", "#bbbbbbb", "012345", "1/010203"] do %>
    # test "<%= illegal %>" do
    #   assert_raise TagCloud.Error, fn ->
    #     parse_color("<%= illegal %>")
    #   end
    # end
    # <% end %>

    test "" do
      assert_raise TagCloud.Error, fn ->
        parse_color("")
      end
    end

    test "23/" do
      assert_raise TagCloud.Error, fn ->
        parse_color("23/")
      end
    end

    test "#abcdeg" do
      assert_raise TagCloud.Error, fn ->
        parse_color("#abcdeg")
      end
    end

    test "#aaaaa" do
      assert_raise TagCloud.Error, fn ->
        parse_color("#aaaaa")
      end
    end

    test "#bbbbbbb" do
      assert_raise TagCloud.Error, fn ->
        parse_color("#bbbbbbb")
      end
    end

    test "012345" do
      assert_raise TagCloud.Error, fn ->
        parse_color("012345")
      end
    end

    test "1/010203" do
      assert_raise TagCloud.Error, fn ->
        parse_color("1/010203")
      end
    end


  end
end
