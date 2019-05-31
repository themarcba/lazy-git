#! /usr/bin/env node

let shell = require("shelljs");
const fullBranchName = require('current-git-branch');

let branch = fullBranchName();
let branchCategory = branch.split('/')[0];
let branchName = branch.split('/')[1];

shell.exec('git add -A .');

process.argv.forEach(function (val, index, array) {
    console.log(index + ': ' + val);
  });
  