# Project version bump up with commits
function releaseinci {
    echo "function: releaseinci"
# Committer details to be used by standard-version to commit to this project.
    git config --global user.name "committer_username"
    git config --global user.email "committer@de.bosch.com"
    npx standard-version
    git config --list
    echo -e "Push\n to\n git\n repository\n"
    git push --follow-tags https://$(urlencode ${LOGIN_USR}):$(urlencode ${LOGIN_PSW})@github.boschdevcloud.com/TT-RHC-Third-Party-Projects/comd.git HEAD:master

}