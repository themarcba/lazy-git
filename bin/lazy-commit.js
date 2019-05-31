#! /usr/bin/env node

let shell = require("shelljs");
const fullBranchName = require('current-git-branch');
let branch = fullBranchName();
let branchCategory = branch.split('/')[0];
let branchName = branch.split('/')[1];

console.log({
    branch,
    branchCategory,
    branchName
});