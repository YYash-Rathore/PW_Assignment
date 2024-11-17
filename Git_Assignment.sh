#Task 1
mkdir myFolder
cd mkdir
touch Code.txt Log.txt Output.txt
git init
git add .
git commit -m "Added Files"
git push origin master

#Task 2
git init
touch feature1.txt feature2.txt
git branch develop
git branch feature1
git branch feature2
git checkout develop
touch develop.txt
git stash develop.txt
git checkout feature1
touch new.txt
git add new.txt
git commit -m "Added File to Feature1"
git push origin feature1
git checkout develop
git stash apply stash@{0}

#Task 3
git init
git branch develop
git branch f1
git branch f2
touch main.txt
git add .
git commit -m "Added main.txt to master branch"
git checkout develop
touch develop.txt
git add .
git commit -m "Added develop.txt in develop branch"
git push origin develop
git checkout f1
touch f1.txt
git add .
git commit -m "Added f1.txt in f1 branch"
git push origin f1
git checkout f2
touch f2.txt
git add .
git commit -m "Added f2.txt in f2 branch"
git push origin f2
git branch -d f2

#Task 4
touch master.txt
git add .
git commit -m "Added master.txt in master branch"
git branch public1
git branch public2
git branch private
git checkout public1
touch public1.txt
git add .
git commit -m "Added public1.txt in Public1 branch"
git checkout master
git merge public1
git merge public2
git checkout private
nano master.txt
git add .
git commit -m "Changes on master.txt"
git checkout master
git merge private
git checkout public1
git merge master
git checkout public2
git merge master