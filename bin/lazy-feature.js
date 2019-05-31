#! /usr/bin/env node

let shell = require("shelljs");
const fullBranchName = require('current-git-branch');
const chalk = require('chalk');

let branch = fullBranchName();
let branchCategory = branch.split('/')[0];
let branchName = branch.split('/')[1];

// Preparing and evaluating the passed arguments
const args = process.argv.splice(2);
// let commitMessage = args[0];
