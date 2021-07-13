echo "Replacing http with https..."

# Replace http:// with https://
find dist -type f -iname "*" -exec sed -i "s/http:\/\//https:\/\//g" {} \;

echo "Done!"
