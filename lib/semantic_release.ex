defmodule SemanticRelease do
  @moduledoc false

  @spec install_path() :: String.t()
  def install_path() do
    Path.join([Mix.Project.build_path(), "semantic_release"])
  end

  @spec bin_path() :: String.t()
  def bin_path() do
    Path.join([install_path(), "node_modules", ".bin", "semantic-release"])
  end
end
