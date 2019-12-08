bash ~/labs/bash-scripts/servers-stop.sh

rm -rf .git
rm -rf bash-scripts
rm -rf tests
rm README.md
rm text.txt

git init
git remote add origin https://github.com/skiffich/noSqlBI-UX.git
git pull origin master