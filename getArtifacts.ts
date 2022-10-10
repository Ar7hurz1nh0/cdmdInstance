import { writeFileSync } from "fs"

interface GitHubRelease {
    assets: {
        name: string,
        browser_download_url: string
    }[]
  }

const latestRelease: Promise<GitHubRelease> = fetch("https://api.github.com/repos/Ar7hurz1nh0/Launcher/releases/latest").then(data => data.json());
(async () => {
  const release: GitHubRelease = {
    assets: (await latestRelease).assets.map(json => ({ name: json.name, browser_download_url: json.browser_download_url }))
  }

  writeFileSync('public/artifacts.json', JSON.stringify(release, null, 2))
})()
