import Config

config :nodelix,
  version: "20.10.0"

config :semantic_release,
  additional_packages: [
    "semantic-release-hex@next",
    "@semantic-release/changelog",
    "@semantic-release/git",
    "@semantic-release/exec",
    "@insurgent/conventional-changelog-preset"
  ]
