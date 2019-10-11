#! /usr/bin/env node

let shell = require('shelljs')
const fullBranchName = require('current-git-branch')
const chalk = require('chalk')

// Read current Branch and split it into category and name
// (release/1.0.3 => { category: 'release', name: '1.0.3' })
let currentBranch = {
    full: fullBranchName(),
    category: fullBranchName().split('/')[0],
    name: fullBranchName().split('/')[1]
}

// Preparing the passed arguments
const args = process.argv.splice(2)

// Check if the command for finishing a release has been passed
if (['finish', 'stop'].includes(args[0])) {
    let releaseVersion = args[1]

    // When a release version has been provided
    if (releaseVersion) {
        console.log(chalk.green(`Oh boy, the release ${releaseVersion} is ready?`))
        console.log(chalk.green(`Good luck with the deploy! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧`))
        shell.exec(`git flow release finish ${releaseVersion}`)
    } else {
        // When no release version has been provided

        // Check if the current branch is a release. If yes, finish current branch.
        if (currentBranch.category === 'release') {
            console.log(chalk.green(`Oh boy, the release ${currentBranch.name} is ready?`))
            console.log(chalk.green(`Good luck with the deploy! (ﾉ◕ヮ◕)ﾉ*:・ﾟ✧`))
            shell.exec(`git flow release finish ${currentBranch.name}`)
        } else {
            // If the current branch is not a release, it must be a mistake by the user
            console.log(chalk.red(`You're not in a release branch.`))
            console.log(chalk.red(`You're in ${currentBranch.full} (☉_☉)`))
        }
    }
} else {
    // If the arguments passed are not stopping commands

    let releaseVersion = args[0]

    // If no release version has been provided, it must be a mistake by the user
    if (!releaseVersion) {
        try {
            const pjson = require('../package.json')
            releaseVersion = pjson.version
            console.log(chalk.green(`Creating a new release with the version ${releaseVersion} •ᴗ•`))
            shell.exec(`git flow release start "${releaseVersion}"`)
        } catch (error) {
            console.log(chalk.red("You're trying to create a new release."))
            console.log(chalk.red("It would be awesome if you'd provide a version number for that (╯°□°）╯︵ ┻━┻"))
        }

        // If a release version is provided, create it
    } else {
        console.log(chalk.green(`Creating a new release, eh?`))
        console.log(chalk.green(`Don't forget to bump the version in your code to ${releaseVersion} •ᴗ•`))
        shell.exec(`git flow release start "${releaseVersion}"`)
    }
}
