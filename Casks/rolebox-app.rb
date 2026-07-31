cask "rolebox-app" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "dd1aa9cd5f334bfd56b1992bdbf835dc519c7776ea3c0be8553db6c14583be2e",
         intel: "312d09958f8917454016c285b01153bad14f6ee6bccebafcff5f2c5782b70a92"

  url "https://github.com/mattracki/rolebox/releases/download/v#{version}/Rolebox-macOS-#{arch}.zip"
  name "Rolebox"
  desc "Desktop profile manager for Codex, Claude Code, and shared agent contexts"
  homepage "https://github.com/mattracki/rolebox"

  depends_on macos: :monterey

  app "Rolebox.app"

  zap trash: [
    "~/.config/rolebox",
    "~/.local/share/rolebox",
  ]
end
