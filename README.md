# Semantic Release for Elixir

Mix tasks for installing and running [`semantic-release`](https://github.com/semantic-release/semantic-release/) (and the adapter plugin [`semantic-release-hex`](https://github.com/talent-ideal/semantic-release-hex/)) in Elixir projects.

> **⚠️ WARNING**
>
> This is a pre-release version. As such, anything _may_ change
> at any time, the public API _should not_ be considered stable,
> and using a pinned version is _recommended_.

Full documentation can be found at [https://hexdocs.pm/semantic_release](https://hexdocs.pm/semantic_release).

## Installation

`gpg` must be available in your PATH to verify the signature of Node.js releases.

The package can be installed by adding `semantic_release` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:semantic_release, "0.1.0", only: :dev, runtime: false}
  ]
end
```

## Versioning

This project follows the principles of [Semantic Versioning (SemVer)](https://semver.org/).