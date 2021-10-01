defmodule TagCloud.Cli do
  @usage """
  usage:

      tag_cloud --help
      tag_cloud --version
      tag_cloud [ options... <file> ]

  convert file from Markdown to HTML.using Earmark and allowing for TagCloud annotations

  cond do

      file ends with .eex -> treat it as an EEx template

      true                -> treat file as plain markdown

  """

  @moduledoc @usage

  def main(argv) do
    argv
    |> TagCloud.Cli.Implementation.run()
    |> output()
  end

  defp output({device, string}) do
    IO.puts(device, string)
    if device == :stderr, do: exit(1)
  end
end
