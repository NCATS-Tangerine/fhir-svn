find . -name '*.xml' -exec sed -i '' 's/<code value="F"/<code value="female"/' {} \;
find . -name '*.xml' -exec sed -i '' 's/<code value="M"/<code value="male"/' {} \;
