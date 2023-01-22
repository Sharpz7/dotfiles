# Get name of the current git origin
REPO=$(git remote get-url origin)

git remote add upstream $REPO || true
git fetch upstream
git checkout master
git merge upstream/master
git push origin master