defmodule SemanticRelease.MixProject do
  use Mix.Project

  @version "1.0.0-alpha.2"
  @source_url "https://github.com/talent-ideal/semantic_release"

  def project do
    [
      app: :semantic_release,
      version: @version,
      elixir: "~> 1.12",
      deps: deps(),
      dialyzer: dialyzer(),
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:nodelix, "1.0.0-alpha.9", runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp dialyzer() do
    [
      plt_add_apps: [:mix, :nodelix],
      plt_local_path: "priv/plts/project.plt",
      plt_core_path: "priv/plts/core.plt"
    ]
  end

  defp description() do
    """
    Fully automated version management and package publishing.
    """
  end

  defp package() do
    [
      maintainers: ["Pierre Cavin"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs() do
    [
      name: "SemanticRelease",
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/semantic_release",
      extras: ["README.md", "CHANGELOG.md", "LICENSE.md"]
    ]
  end
end
