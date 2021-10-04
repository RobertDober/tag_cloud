defmodule TagCloud.Cli.Implementation do
  use TagCloud.Types

  @type output_tuple :: {:stderr, binary()} | {:stdio, binary()}
  @typep parse_result :: :help | :version | output_tuple() | binary()

  @annotation "%tc:"

  @spec run(list(binary)) :: output_tuple()
  def run(argv) do
    argv
    |> _parse_args()
    |> _process()
  end

  @args """
  usage:

     tag_cloud --help
     tag_cloud --version
     tag_cloud [ options... <file> ]

  evaluate an EEx template file with the local variable `tc` set to `TagCloud` for your convenience

     where options can be any of:

     none so far
  """

  @spec _parse_args(binaries()) :: parse_result()
  defp _parse_args(argv) do
    switches = [
      ]
    aliases = [
      h: :help,
      v: :version
    ]

    case OptionParser.parse(argv, switches: switches, aliases: aliases) do
      { [ {:help, true} ], _, _ } -> :help
      { [ {:version, true} ], _, _ } -> :version
      { _options, [ file ],  _ }  -> file
      { _options, [ ],           _ }  -> {:stderr, "need a file argument"}
    end
  end

  @spec _process(parse_result()) :: output_tuple()
  defp _process(what)
  defp _process({_, _}=output), do: output
  defp _process(:help), do: {:stdio, @args}
  defp _process(:version), do: {:stdio, TagCloud.version}
  defp _process(file), do: _process_file(file)


  @spec _process_file(binary()) :: output_tuple()
  defp _process_file(file) do
    try do
      {:stdio, EEx.eval_file(file, tc: TagCloud)}
    rescue
      e in File.Error -> {:stderr, Exception.message(e)}
    end
  end

end
