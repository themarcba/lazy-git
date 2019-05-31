#! /usr/bin/env node
let shell = require("shelljs");
const branchName = require('current-git-branch');
let branch = branchName();
// let branch = shell.exec("$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')");

branch = `-${branch}-`;
console.log(' => --[lazy] ' + branch);
