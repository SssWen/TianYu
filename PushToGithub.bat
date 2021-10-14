@cd  !cd! 
git add .
git stash
git pull
git stash pop
git commit -m "diffuse+specular" -a
git push

start /b

pause