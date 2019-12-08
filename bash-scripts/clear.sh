bash ./servers-stop.sh

rm -rf .git
rm -rf bash-scripts
rm -rf tests
rm README.md

git init
git remote add origin https://github.com/skiffich/noSqlBI-UX.git
git pull origin master