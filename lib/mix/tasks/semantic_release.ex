defmodule Mix.Tasks.SemanticRelease do
  @moduledoc """
  Runs Semantic Release.

  Automatically installs Semantic Release and other dependencies by running `Mix.Tasks.SemanticRelease.Install`.

  > ### Warning {: .warning}
  >
  > This is a pre-release version. As such, anything _may_ change at any time, the public
  > API _should not_ be considered stable, and using a pinned version is _recommended_.

  Usage:

      $ mix semantic_release
      $ mix semantic_release CLI_ARGS

  Refer to the [Semantic Release documentation][1] for available CLI arguments.


  [1]: https://semantic-release.gitbook.io/semantic-release/usage/configuration#options
  """

  @shortdoc "Runs Semantic Release"
  @requirements ["nodelix.install", "semantic_release.install"]

  use Mix.Task
  require Logger

  @impl Mix.Task
  @spec run(list(String.t())) :: :ok
  def run(args) do
    Logger.debug("Running Semantic Release ...")

    Mix.Tasks.Nodelix.run(
      [
        SemanticRelease.bin_path()
      ] ++ args
    )
  end
end
