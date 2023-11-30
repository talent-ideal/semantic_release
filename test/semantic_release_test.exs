defmodule SemanticReleaseTest do
  use ExUnit.Case
  doctest SemanticRelease

  setup_all do
    IO.puts(SemanticRelease.install_path())

    File.rm_rf!(SemanticRelease.install_path())

    {branch, code} = System.cmd("git", ["branch", "--show-current"])
    if code !== 0, do: raise("Git command exited with non-zero code #{code}: #{branch}")

    branch = String.trim(branch, "\n")
    {:ok, branch: branch}
  end

  test "installs Semantic Release" do
    assert Mix.Task.rerun("semantic_release.install") == :ok
  end

  test "runs Semantic Release", context do
    assert Mix.Task.rerun("semantic_release", [
             "--dry-run",
             "--branches",
             "\"main,#{context[:branch]}\""
           ]) ==
             :ok
  end
end
