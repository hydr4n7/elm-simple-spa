path=$(pwd)
echo $path
cp src/static/*.css $path/dist/.
elm-make src/Main.elm --output $path/dist/main.js
echo -n
echo '>>> Reload Your Browser > Ctrl + R'

