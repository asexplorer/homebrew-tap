cask "asexplorer" do
  arch arm: "Apple-Silicon", intel: "Intel"

  version "1.0.0"
  sha256 arm:   "b98e620533e765f26612d02d906f2c728ddb444953927be411107d4fbb28ff8d",
         intel: "365bbed8b6adda2bdd1eac8ee95175e00e06af8ab443f2c929cf16ec6c22adef"

  url "https://asexplorer.com/downloads/#{version}/ASexplorer-#{version}-#{arch}.dmg"
  name "ASexplorer"
  desc "File explorer with tabs, a preview pane and an Explorer-style context menu"
  homepage "https://asexplorer.com/"

  livecheck do
    url "https://asexplorer.com/version.json"
    strategy :json do |json|
      json["latestVersion"]
    end
  end

  depends_on macos: ">= :monterey"

  app "ASexplorer.app"

  zap trash: [
    "~/Library/Application Support/ASexplorer",
    "~/Library/Logs/ASexplorer",
    "~/Library/Preferences/hr.novenas-it.asexplorer.plist",
    "~/Library/Saved Application State/hr.novenas-it.asexplorer.savedState",
  ]

  caveats <<~EOS
    If ASexplorer is your default file viewer, choose "Restore Finder as the Default File Viewer"
    in its app menu before uninstalling it.
  EOS
end
