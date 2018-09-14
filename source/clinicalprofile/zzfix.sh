find . -name '*.xml' -exec sed -i '' 's/ value=""/ value="UNK"/' {} \;
