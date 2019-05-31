#! /usr/bin/env node

let shell = require("shelljs");
const chalk = require('chalk');
const fullBranchName = require('current-git-branch');
let currentBranch = fullBranchName();

// Preparing and evaluating the passed arguments
const args = process.argv.splice(2);
let pullBranch = args[0];

if(pullBranch) {
    // # Check for develop (or lazy shortcur "d")
    if(['d', 'develop'].includes(pullBranch)) {
        pullBranch = 'develop';
    }
    // Check for master (or lazy shortcur "m")
    else if(['m', 'master'].includes(pullBranch)) {
        pullBranch = 'master';
    }

    // In any other case, a pullBranch has been passed as argument
    // which will be used to pulled from

} else {
    pullBranch = currentBranch;
}

// Show message and pull
console.log(chalk.green(`(☞ﾟヮﾟ)☞ Pulling from ${pullBranch}...`));
shell.exec(`git pull origin ${pullBranch}`);