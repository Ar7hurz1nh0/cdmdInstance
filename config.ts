import { cwd } from "process"
export const instances = <const> ['base', 'enhanced', 'extra', 'beta']

export default class {
  static readonly instances: readonly string[] = instances
  constructor (readonly instanceName: typeof instances[number]) {
    if (!instances.includes(this.instanceName))
      throw <const> `Error: Invalid instance (${this.instanceName})`
  }
  get PreLaunchCommand() {
    return <const> `"$INST_JAVA" -jar "$INST_DIR/updater.jar" "https://mods.cdmd.dev/${this.instanceName}/pack.toml" --no-gui --bootstrap-main-jar "$INST_DIR/installer.jar" --pack-folder "$INST_DIR" --bootstrap-no-update`
  }
  get filePath() {
    return <const> `${this.workPath}/instance.cfg`
  }
  get workPath() {
    return <const> `${cwd()}/cache/${this.instanceName}`
  }
  get indexPath() {
    return <const> `${cwd()}/public/${this.instanceName}/index`
  }
}