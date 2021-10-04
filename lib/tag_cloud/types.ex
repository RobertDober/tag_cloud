defmodule TagCloud.Types do
  defmacro __using__(_opts \\ []) do
    quote do
      @type ast_node ::  {binary(), attributes(), [ast_node()], map()}
      @type attribute :: {binary(), binary()}
      @type attributes :: [attribute()]

      @type binaries :: [binary()]

      @type maybe(t) :: t | nil
    end
  end
end
