import Parser from 'configparser'
import Config from './config'
import { argv } from 'process'
import { readFileSync, writeFileSync } from 'fs'

// @ts-ignore
const config = new Config(argv[2]);

const file = config.filePath

const properties = new Parser()

let content = readFileSync(file).toString().split('\n')
content.unshift("[Main]")
writeFileSync(file, content.join('\n'))

properties.read(file)
properties.set("Main", "PreLaunchCommand", config.PreLaunchCommand)
properties.write(file)

content = readFileSync(file).toString().split('\n')
content.shift()
writeFileSync(file, content.join('\n'))