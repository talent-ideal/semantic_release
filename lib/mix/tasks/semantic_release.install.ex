defmodule Mix.Tasks.SemanticRelease.Install do
  @moduledoc """
  Installs Semantic Release and other dependencies.

  > ### Warning {: .warning}
  >
  > This is a pre-release version. As such, anything _may_ change at any time, the public
  > API _should not_ be considered stable, and using a pinned version is _recommended_.

  Usage:

      $ mix semantic_release.install

  """

  @shortdoc "Installs Semantic Release"
  @requirements ["nodelix.install"]

  use Mix.Task
  require Logger

  @impl Mix.Task
  def run(_) do
    Logger.debug("Installing dependencies ...")

    Mix.Task.run("nodelix.npm", [
      "install",
      "--silent",
      "--prefix",
      SemanticRelease.install_path(),
      "--no-save",
      "semantic-release",
      "@semantic-release/changelog",
      "@semantic-release/git",
      "@semantic-release/exec",
      "semantic-release-hex@next"
    ])

    Logger.debug("Auditing signatures ...")

    Mix.Task.run("nodelix.npm", [
      "audit",
      "signatures",
      "--silent",
      "--prefix",
      SemanticRelease.install_path()
    ])

    Logger.debug("Dependencies are up-to-date.")
  end
end
