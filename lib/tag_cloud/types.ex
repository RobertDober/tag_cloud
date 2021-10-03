defmodule TagCloud.Types do
  defmacro __using__(_opts \\ []) do
    quote do
      @type ast :: Earmark.ast
      @type ast_node :: Earmark.ast_node
      @type attribute :: Earmark.ast_attribute
      @type attributes :: Earmark.ast_attributes

      @type binaries :: [binary()]

      @type maybe(t) :: t | nil
    end
  end
end
