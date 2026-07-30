cask "rolebox-app" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "5a63eb84128bb1be5686464b9665f9a8ea8577defeba91d8203738b349c44b00",
         intel: "2fc5aa5d0d49a415b58566d228b7ca1607c59bf0152bd04f869dc67964e9e38b"

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
