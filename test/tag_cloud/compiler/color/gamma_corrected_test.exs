defmodule Test.TagCloud.Compiler.Color.GammaCorrectedTest do
  use ExUnit.Case

  import TagCloud.Compiler.Color, only: [gamma_corrected: 2, gamma_corrected_octet: 2]

  describe "all scales of gray" do
    # <%= for {scale, color} <- 0..12 |> Enum.zip(["ffffff", "f5f5f5", "ebebeb", "e0e0e0", "d4d4d4", "c8c8c8", "bababa", "ababab", "9b9b9b", "888888", "717171", "525252", "000000"]) do %>
    # test "gamma_corrected(<%= scale %>, 000000" do
    #   result = gamma_corrected(<%= scale %>, "000000")
    #   expected = "<%= color %>"

    #   assert result == expected
    # end
    # <% end %>

    test "gamma_corrected(0, 000000" do
      result = gamma_corrected(0, "000000")
      expected = "ffffff"

      assert result == expected
    end

    test "gamma_corrected(1, 000000" do
      result = gamma_corrected(1, "000000")
      expected = "f5f5f5"

      assert result == expected
    end

    test "gamma_corrected(2, 000000" do
      result = gamma_corrected(2, "000000")
      expected = "ebebeb"

      assert result == expected
    end

    test "gamma_corrected(3, 000000" do
      result = gamma_corrected(3, "000000")
      expected = "e0e0e0"

      assert result == expected
    end

    test "gamma_corrected(4, 000000" do
      result = gamma_corrected(4, "000000")
      expected = "d4d4d4"

      assert result == expected
    end

    test "gamma_corrected(5, 000000" do
      result = gamma_corrected(5, "000000")
      expected = "c8c8c8"

      assert result == expected
    end

    test "gamma_corrected(6, 000000" do
      result = gamma_corrected(6, "000000")
      expected = "bababa"

      assert result == expected
    end

    test "gamma_corrected(7, 000000" do
      result = gamma_corrected(7, "000000")
      expected = "ababab"

      assert result == expected
    end

    test "gamma_corrected(8, 000000" do
      result = gamma_corrected(8, "000000")
      expected = "9b9b9b"

      assert result == expected
    end

    test "gamma_corrected(9, 000000" do
      result = gamma_corrected(9, "000000")
      expected = "888888"

      assert result == expected
    end

    test "gamma_corrected(10, 000000" do
      result = gamma_corrected(10, "000000")
      expected = "717171"

      assert result == expected
    end

    test "gamma_corrected(11, 000000" do
      result = gamma_corrected(11, "000000")
      expected = "525252"

      assert result == expected
    end

    test "gamma_corrected(12, 000000" do
      result = gamma_corrected(12, "000000")
      expected = "000000"

      assert result == expected
    end



  end
  describe "all scales of 00" do
    # <%= for {scale, corrected} <- 0..12 |> Enum.zip(~w[ff f5 eb e0 d4 c8 ba ab 9b 88 71 52 00]) do %>
    # test "<%= scale %>" do
    #   result = gamma_corrected_octet(<%= scale %>, "00")
    #   expected = "<%= corrected %>"

    #   assert result == expected
    # end
    # <% end %>

    test "0" do
      result = gamma_corrected_octet(0, "00")
      expected = "ff"

      assert result == expected
    end

    test "1" do
      result = gamma_corrected_octet(1, "00")
      expected = "f5"

      assert result == expected
    end

    test "2" do
      result = gamma_corrected_octet(2, "00")
      expected = "eb"

      assert result == expected
    end

    test "3" do
      result = gamma_corrected_octet(3, "00")
      expected = "e0"

      assert result == expected
    end

    test "4" do
      result = gamma_corrected_octet(4, "00")
      expected = "d4"

      assert result == expected
    end

    test "5" do
      result = gamma_corrected_octet(5, "00")
      expected = "c8"

      assert result == expected
    end

    test "6" do
      result = gamma_corrected_octet(6, "00")
      expected = "ba"

      assert result == expected
    end

    test "7" do
      result = gamma_corrected_octet(7, "00")
      expected = "ab"

      assert result == expected
    end

    test "8" do
      result = gamma_corrected_octet(8, "00")
      expected = "9b"

      assert result == expected
    end

    test "9" do
      result = gamma_corrected_octet(9, "00")
      expected = "88"

      assert result == expected
    end

    test "10" do
      result = gamma_corrected_octet(10, "00")
      expected = "71"

      assert result == expected
    end

    test "11" do
      result = gamma_corrected_octet(11, "00")
      expected = "52"

      assert result == expected
    end

    test "12" do
      result = gamma_corrected_octet(12, "00")
      expected = "00"

      assert result == expected
    end


  end
  describe "all scales of ff" do
    # <%= for {scale, corrected} <- 0..12 |> Enum.zip(~w[ff f5 eb e0 d4 c8 ba ab 9b 88 71 52 00]) do %>
    # test "<%= scale %>" do
    #   result = gamma_corrected_octet(<%= scale %>, "00")
    #   expected = "<%= corrected %>"

    #   assert result == expected
    # end
    # <% end %>

    test "0" do
      result = gamma_corrected_octet(0, "ff")
      expected = "ff"

      assert result == expected
    end

    test "1" do
      result = gamma_corrected_octet(1, "ff")
      expected = "ff"

      assert result == expected
    end

    test "2" do
      result = gamma_corrected_octet(2, "ff")
      expected = "ff"

      assert result == expected
    end

    test "3" do
      result = gamma_corrected_octet(3, "ff")
      expected = "ff"

      assert result == expected
    end

    test "4" do
      result = gamma_corrected_octet(4, "ff")
      expected = "ff"

      assert result == expected
    end

    test "5" do
      result = gamma_corrected_octet(5, "ff")
      expected = "ff"

      assert result == expected
    end

    test "6" do
      result = gamma_corrected_octet(6, "ff")
      expected = "ff"

      assert result == expected
    end

    test "7" do
      result = gamma_corrected_octet(7, "ff")
      expected = "ff"

      assert result == expected
    end

    test "8" do
      result = gamma_corrected_octet(8, "ff")
      expected = "ff"

      assert result == expected
    end

    test "9" do
      result = gamma_corrected_octet(9, "ff")
      expected = "ff"

      assert result == expected
    end

    test "10" do
      result = gamma_corrected_octet(10, "ff")
      expected = "ff"

      assert result == expected
    end

    test "11" do
      result = gamma_corrected_octet(11, "ff")
      expected = "ff"

      assert result == expected
    end

    test "12" do
      result = gamma_corrected_octet(12, "ff")
      expected = "ff"

      assert result == expected
    end


  end
end
