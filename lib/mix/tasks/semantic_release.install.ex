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
    node_version = Nodelix.VersionManager.latest_lts_version()

    # force installation on CI because using the cached version fails
    if not Nodelix.VersionManager.is_installed?(node_version) or
         System.get_env("CI") == "true" do
      Nodelix.VersionManager.install(node_version)
    end

    Logger.debug("Installing dependencies ...")

    Mix.Tasks.Nodelix.Npm.run(
      [
        "install",
        "--silent",
        "--prefix",
        SemanticRelease.install_path(),
        "--no-save",
        "semantic-release",
        "semantic-release-hex"
      ] ++ Application.get_env(:semantic_release, :additional_packages, [])
    )

    Logger.debug("Auditing signatures ...")

    Mix.Tasks.Nodelix.Npm.run([
      "audit",
      "signatures",
      "--silent",
      "--prefix",
      SemanticRelease.install_path()
    ])

    Logger.debug("Dependencies are up-to-date.")
  end
end
