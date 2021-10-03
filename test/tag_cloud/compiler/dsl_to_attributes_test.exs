defmodule Test.TagCloud.Compiler.DslToAttributesTest do
  use ExUnit.Case

  import TagCloud.Compiler, only: [dsl_to_attributes: 1]

  describe "colors: gamma corrected gray scales" do
    test "0" do
      result = dsl_to_attributes("0 12 100")
      expected = {"style", "color: #ffffff; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "1" do
      result = dsl_to_attributes("1 16pt 100")
      expected = {"style", "color: #f5f5f5; font-size: 16pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "2" do
      result = dsl_to_attributes("2 3em 100")
      expected = {"style", "color: #ebebeb; font-size: 3em; font-weight: 100;"}
      assert result == [expected]
    end
    test "3" do
      result = dsl_to_attributes("3 12 100")
      expected = {"style", "color: #e0e0e0; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "4" do
      result = dsl_to_attributes("4 12 100")
      expected = {"style", "color: #d4d4d4; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "5" do
      result = dsl_to_attributes("5 12 100")
      expected = {"style", "color: #c8c8c8; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "6" do
      result = dsl_to_attributes("6 12 100")
      expected = {"style", "color: #bababa; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "7" do
      result = dsl_to_attributes("7 12 100")
      expected = {"style", "color: #ababab; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "8" do
      result = dsl_to_attributes("8 12 100")
      expected = {"style", "color: #9b9b9b; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "9" do
      result = dsl_to_attributes("9 12 100")
      expected = {"style", "color: #888888; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "10" do
      result = dsl_to_attributes("10 12 100")
      expected = {"style", "color: #717171; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "11" do
      result = dsl_to_attributes("11 12 100")
      expected = {"style", "color: #525252; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "12" do
      result = dsl_to_attributes("12 12 100")
      expected = {"style", "color: #000000; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
  end

  # <%= for color <- ~w[red lime blue] do %>
  # <% color_map =[ "ff", "f5", "eb", "e0", "d4", "c8", "ba", "ab", "9b", "88", "71", "52", "00" ] %>
  # <% color_pos = %{"red" => "ffxx", "lime" => "xffx", "blue" => "xxff"} %>
  # describe "color shades <%= color %>" do
  #   <%= for shade <- 0..12 do %>
  #   test "<%= shade %>" do
  #     result = dsl_to_attributes("<%= shade %>/<%= color %>")
  #     <% hexcolor = Map.get(color_pos, color) |> String.replace("x", Enum.at(color_map, shade)) %>
  #     expected = {"style", "color: #<%= hexcolor %>;"}
  #     assert result == [expected]
  #   end
  #   <% end %>
  # end
  # <% end %>
  describe "color shades red" do

    test "0" do
      result = dsl_to_attributes("0/red")

      expected = {"style", "color: #ffffff;"}
      assert result == [expected]
    end

    test "1" do
      result = dsl_to_attributes("1/red")

      expected = {"style", "color: #fff5f5;"}
      assert result == [expected]
    end

    test "2" do
      result = dsl_to_attributes("2/red")

      expected = {"style", "color: #ffebeb;"}
      assert result == [expected]
    end

    test "3" do
      result = dsl_to_attributes("3/red")

      expected = {"style", "color: #ffe0e0;"}
      assert result == [expected]
    end

    test "4" do
      result = dsl_to_attributes("4/red")

      expected = {"style", "color: #ffd4d4;"}
      assert result == [expected]
    end

    test "5" do
      result = dsl_to_attributes("5/red")

      expected = {"style", "color: #ffc8c8;"}
      assert result == [expected]
    end

    test "6" do
      result = dsl_to_attributes("6/red")

      expected = {"style", "color: #ffbaba;"}
      assert result == [expected]
    end

    test "7" do
      result = dsl_to_attributes("7/red")

      expected = {"style", "color: #ffabab;"}
      assert result == [expected]
    end

    test "8" do
      result = dsl_to_attributes("8/red")

      expected = {"style", "color: #ff9b9b;"}
      assert result == [expected]
    end

    test "9" do
      result = dsl_to_attributes("9/red")

      expected = {"style", "color: #ff8888;"}
      assert result == [expected]
    end

    test "10" do
      result = dsl_to_attributes("10/red")

      expected = {"style", "color: #ff7171;"}
      assert result == [expected]
    end

    test "11" do
      result = dsl_to_attributes("11/red")

      expected = {"style", "color: #ff5252;"}
      assert result == [expected]
    end

    test "12" do
      result = dsl_to_attributes("12/red")

      expected = {"style", "color: #ff0000;"}
      assert result == [expected]
    end

  end

  describe "color shades lime" do

    test "0" do
      result = dsl_to_attributes("0/lime")

      expected = {"style", "color: #ffffff;"}
      assert result == [expected]
    end

    test "1" do
      result = dsl_to_attributes("1/lime")

      expected = {"style", "color: #f5fff5;"}
      assert result == [expected]
    end

    test "2" do
      result = dsl_to_attributes("2/lime")

      expected = {"style", "color: #ebffeb;"}
      assert result == [expected]
    end

    test "3" do
      result = dsl_to_attributes("3/lime")

      expected = {"style", "color: #e0ffe0;"}
      assert result == [expected]
    end

    test "4" do
      result = dsl_to_attributes("4/lime")

      expected = {"style", "color: #d4ffd4;"}
      assert result == [expected]
    end

    test "5" do
      result = dsl_to_attributes("5/lime")

      expected = {"style", "color: #c8ffc8;"}
      assert result == [expected]
    end

    test "6" do
      result = dsl_to_attributes("6/lime")

      expected = {"style", "color: #baffba;"}
      assert result == [expected]
    end

    test "7" do
      result = dsl_to_attributes("7/lime")

      expected = {"style", "color: #abffab;"}
      assert result == [expected]
    end

    test "8" do
      result = dsl_to_attributes("8/lime")

      expected = {"style", "color: #9bff9b;"}
      assert result == [expected]
    end

    test "9" do
      result = dsl_to_attributes("9/lime")

      expected = {"style", "color: #88ff88;"}
      assert result == [expected]
    end

    test "10" do
      result = dsl_to_attributes("10/lime")

      expected = {"style", "color: #71ff71;"}
      assert result == [expected]
    end

    test "11" do
      result = dsl_to_attributes("11/lime")

      expected = {"style", "color: #52ff52;"}
      assert result == [expected]
    end

    test "12" do
      result = dsl_to_attributes("12/lime")

      expected = {"style", "color: #00ff00;"}
      assert result == [expected]
    end

  end

  describe "color shades blue" do

    test "0" do
      result = dsl_to_attributes("0/blue")

      expected = {"style", "color: #ffffff;"}
      assert result == [expected]
    end

    test "1" do
      result = dsl_to_attributes("1/blue")

      expected = {"style", "color: #f5f5ff;"}
      assert result == [expected]
    end

    test "2" do
      result = dsl_to_attributes("2/blue")

      expected = {"style", "color: #ebebff;"}
      assert result == [expected]
    end

    test "3" do
      result = dsl_to_attributes("3/blue")

      expected = {"style", "color: #e0e0ff;"}
      assert result == [expected]
    end

    test "4" do
      result = dsl_to_attributes("4/blue")

      expected = {"style", "color: #d4d4ff;"}
      assert result == [expected]
    end

    test "5" do
      result = dsl_to_attributes("5/blue")

      expected = {"style", "color: #c8c8ff;"}
      assert result == [expected]
    end

    test "6" do
      result = dsl_to_attributes("6/blue")

      expected = {"style", "color: #babaff;"}
      assert result == [expected]
    end

    test "7" do
      result = dsl_to_attributes("7/blue")

      expected = {"style", "color: #ababff;"}
      assert result == [expected]
    end

    test "8" do
      result = dsl_to_attributes("8/blue")

      expected = {"style", "color: #9b9bff;"}
      assert result == [expected]
    end

    test "9" do
      result = dsl_to_attributes("9/blue")

      expected = {"style", "color: #8888ff;"}
      assert result == [expected]
    end

    test "10" do
      result = dsl_to_attributes("10/blue")

      expected = {"style", "color: #7171ff;"}
      assert result == [expected]
    end

    test "11" do
      result = dsl_to_attributes("11/blue")

      expected = {"style", "color: #5252ff;"}
      assert result == [expected]
    end

    test "12" do
      result = dsl_to_attributes("12/blue")

      expected = {"style", "color: #0000ff;"}
      assert result == [expected]
    end

  end

end
