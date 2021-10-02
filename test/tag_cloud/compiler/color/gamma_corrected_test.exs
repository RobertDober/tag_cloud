defmodule Test.TagCloud.Compiler.Color.GammaCorrectedTest do
  use ExUnit.Case

  import TagCloud.Compiler.Color, only: [gamma_corrected: 2]

  describe "all scales of 00" do
    # <%= for {scale, corrected} <- 0..12 |> Enum.zip(~w[ff f5 eb e0 d4 c8 ba ab 9b 88 71 52 00]) do %>
    # test "<%= scale %>" do
    #   result = gamma_corrected(<%= scale %>, "00")
    #   expected = "<%= corrected %>"

    #   assert result == expected
    # end
    # <% end %>

    test "0" do
      result = gamma_corrected(0, "00")
      expected = "ff"

      assert result == expected
    end

    test "1" do
      result = gamma_corrected(1, "00")
      expected = "f5"

      assert result == expected
    end

    test "2" do
      result = gamma_corrected(2, "00")
      expected = "eb"

      assert result == expected
    end

    test "3" do
      result = gamma_corrected(3, "00")
      expected = "e0"

      assert result == expected
    end

    test "4" do
      result = gamma_corrected(4, "00")
      expected = "d4"

      assert result == expected
    end

    test "5" do
      result = gamma_corrected(5, "00")
      expected = "c8"

      assert result == expected
    end

    test "6" do
      result = gamma_corrected(6, "00")
      expected = "ba"

      assert result == expected
    end

    test "7" do
      result = gamma_corrected(7, "00")
      expected = "ab"

      assert result == expected
    end

    test "8" do
      result = gamma_corrected(8, "00")
      expected = "9b"

      assert result == expected
    end

    test "9" do
      result = gamma_corrected(9, "00")
      expected = "88"

      assert result == expected
    end

    test "10" do
      result = gamma_corrected(10, "00")
      expected = "71"

      assert result == expected
    end

    test "11" do
      result = gamma_corrected(11, "00")
      expected = "52"

      assert result == expected
    end

    test "12" do
      result = gamma_corrected(12, "00")
      expected = "00"

      assert result == expected
    end


  end
  describe "all scales of ff" do
    # <%= for {scale, corrected} <- 0..12 |> Enum.zip(~w[ff f5 eb e0 d4 c8 ba ab 9b 88 71 52 00]) do %>
    # test "<%= scale %>" do
    #   result = gamma_corrected(<%= scale %>, "00")
    #   expected = "<%= corrected %>"

    #   assert result == expected
    # end
    # <% end %>

    test "0" do
      result = gamma_corrected(0, "ff")
      expected = "ff"

      assert result == expected
    end

    test "1" do
      result = gamma_corrected(1, "ff")
      expected = "ff"

      assert result == expected
    end

    test "2" do
      result = gamma_corrected(2, "ff")
      expected = "ff"

      assert result == expected
    end

    test "3" do
      result = gamma_corrected(3, "ff")
      expected = "ff"

      assert result == expected
    end

    test "4" do
      result = gamma_corrected(4, "ff")
      expected = "ff"

      assert result == expected
    end

    test "5" do
      result = gamma_corrected(5, "ff")
      expected = "ff"

      assert result == expected
    end

    test "6" do
      result = gamma_corrected(6, "ff")
      expected = "ff"

      assert result == expected
    end

    test "7" do
      result = gamma_corrected(7, "ff")
      expected = "ff"

      assert result == expected
    end

    test "8" do
      result = gamma_corrected(8, "ff")
      expected = "ff"

      assert result == expected
    end

    test "9" do
      result = gamma_corrected(9, "ff")
      expected = "ff"

      assert result == expected
    end

    test "10" do
      result = gamma_corrected(10, "ff")
      expected = "ff"

      assert result == expected
    end

    test "11" do
      result = gamma_corrected(11, "ff")
      expected = "ff"

      assert result == expected
    end

    test "12" do
      result = gamma_corrected(12, "ff")
      expected = "ff"

      assert result == expected
    end


  end
end
