import { parse } from 'toml';
import { readFileSync, writeFileSync } from 'fs';
// @ts-ignore
import render from 'json2toml';
import { argv } from 'process';

const args = {
  breakage: false,
  bump: false,
  patch: true
}

for (const arg of argv) {
  if (arg.toLowerCase() == "breakage") args.breakage = true;
  if (arg.toLowerCase() == "bump") args.bump = true;
  if ((args.breakage || args.bump) && args.patch) args.patch = false;
}

if (args.breakage && args.bump) {
  throw ("Error: An update should not have \"breakage\" and \"bump\" flags");
}
const pack: { version: string } = parse(readFileSync('kernel/pack.toml', 'utf8'));

let version: [number, number, number] = (pack.version as string).split('.').map(Number) as [number, number, number];

console.table(args);

if (args.bump) {
  version[0]++;
  version[1] = 0;
  version[2] = 0;
}

if (args.breakage) {
  version[1]++;
  version[2] = 0;
}

if (args.patch)
  version[2]++;

pack.version = version.join('.');

writeFileSync('kernel/pack.toml', render(pack, { indent: 2 }));