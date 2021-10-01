defmodule Test.TagCloud.Compiler.MakeAttsFromDescriptionTest do
  use ExUnit.Case

  import TagCloud.Compiler, only: [make_atts_from_description: 1]

  describe "colors: gamma corrected gray scales" do
    test "0" do
      result = make_atts_from_description("0 12 100")
      expected = {"style", "color: #ffffff; font-size: 12pt; font-weight: 100;"}
      assert result == [ expected ]
    end
    test "1" do
      result = make_atts_from_description("1 12 100")
      expected = {"style", "color: #f5f5f5; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "2" do
      result = make_atts_from_description("2 12 100")
      expected = {"style", "color: #ebebeb; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "3" do
      result = make_atts_from_description("3 12 100")
      expected = {"style", "color: #e0e0e0; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "4" do
      result = make_atts_from_description("4 12 100")
      expected = {"style", "color: #d4d4d4; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "5" do
      result = make_atts_from_description("5 12 100")
      expected = {"style", "color: #c8c8c8; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "6" do
      result = make_atts_from_description("6 12 100")
      expected = {"style", "color: #bababa; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "7" do
      result = make_atts_from_description("7 12 100")
      expected = {"style", "color: #ababab; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "8" do
      result = make_atts_from_description("8 12 100")
      expected = {"style", "color: #9b9b9b; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "9" do
      result = make_atts_from_description("9 12 100")
      expected = {"style", "color: #888888; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "10" do
      result = make_atts_from_description("10 12 100")
      expected = {"style", "color: #717171; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "11" do
      result = make_atts_from_description("11 12 100")
      expected = {"style", "color: #525252; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
    test "12" do
      result = make_atts_from_description("12 12 100")
      expected = {"style", "color: #000000; font-size: 12pt; font-weight: 100;"}
      assert result == [expected]
    end
  end
end

