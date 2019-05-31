#! /usr/bin/env node

let shell = require("shelljs");
const chalk = require('chalk');
const fullBranchName = require('current-git-branch');
let currentBranch = fullBranchName();

// Preparing and evaluating the passed arguments
const args = process.argv.splice(2);
let pushBranch = args[0];

if(pushBranch) {
    // # Check for develop (or lazy shortcur "d")
    if(['d', 'develop'].includes(pushBranch)) {
        pushBranch = 'develop';
    }
    // Check for master (or lazy shortcur "m")
    else if(['m', 'master'].includes(pushBranch)) {
        pushBranch = 'master';
    }

    // In any other case, a pushBranch has been passed as argument
    // which will be used to push to

} else {
    pushBranch = currentBranch;
}

// Show message and push
console.log(chalk.green(`(☞ﾟヮﾟ)☞ Pushing to ${pushBranch}...`));
shell.exec(`git push origin ${pushBranch}`);