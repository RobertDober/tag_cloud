defmodule Extractly.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/robertdober/tag_cloud"

  @description """
  Elxir Tools to create Tag clouds - Integration with Earmark Annotations - Independent Library Functions - Gamma correction for grey scales - CSS files
  """


  def project do
    [
      app: :tag_cloud,
      version: @version,
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      # escript: [main_module: Extractly.Cli],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: @description,
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      aliases: [docs: &build_docs/1]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:excoveralls, "~> 0.14.2", only: :test},
      {:dialyxir, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:extractly, "~> 0.5.3", only: [:dev], runtime: false},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      files: [
        "lib",
        "mix.exs",
        "README.md"
      ],
      maintainers: [
        "Robert Dober <robert.dober@gmail.com>"
      ],
      licenses: [
        "Apache 2 (see the file LICENSE for details)"
      ],
      links: %{
        "GitHub" => "https://github.com/robertdober/tag_cloud"
      }
    ]
  end


  @prerequisites """
  run `mix escript.install hex ex_doc` and adjust `PATH` accordingly
  """
  @modulename "TagCloud"
  defp build_docs(_) do
    Mix.Task.run("compile")
    ex_doc = Path.join(Mix.path_for(:escripts), "ex_doc")
    Mix.shell.info("Using escript: #{ex_doc} to build the docs")

    unless File.exists?(ex_doc) do
      raise "cannot build docs because escript for ex_doc is not installed, make sure to \n#{@prerequisites}"
    end

    args = [@modulename, @version, Mix.Project.compile_path()]
    opts = ~w[--main #{@modulename} --source-ref v#{@version} --source-url #{@url}]

    Mix.shell.info("Running: #{ex_doc} #{inspect(args ++ opts)}")
    System.cmd(ex_doc, args ++ opts)
    Mix.shell.info("Docs built successfully")
  end

end
#  SPDX-License-Identifier: Apache-2.0
