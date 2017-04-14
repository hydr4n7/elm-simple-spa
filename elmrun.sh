path=$(pwd)
echo $path
cp *.css $path/dist/.
elm-make Main.elm --output $path/dist/main.js
echo '>>> Reload Your Browser > Ctrl + R'

