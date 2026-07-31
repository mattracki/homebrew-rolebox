cask "rolebox-app" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "1154375651808ad1f5c5d74a651979b10cfc43c2a2b89c11970e02d7d708580a",
         intel: "e6763aace90d8047308b010406ff308d5aace06deec45733451ba4faaf8c00fc"

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
