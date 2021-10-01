defmodule TagCloud.Types do
  defmacro __using__(opts \\ []) do
    quote do
      @type ast :: Earmark.ast
      @type ast_node :: Earmark.ast_node
      @type attribute :: Earmark.ast_attribute
      @type attributes :: Earmark.ast_attributes

      @type binaries :: binaries()
    end
  end
end
