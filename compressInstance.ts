import * as compressing from 'compressing';
import { argv } from 'process';
import {  } from 'fs'
import Config from './config'

// @ts-ignore
const config = new Config(argv[2])

compressing.zip
  .compressDir(config.workPath, config.indexPath)