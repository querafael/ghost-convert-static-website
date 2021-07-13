
echo "Replacing query hash encoded entities in all index.html..."

# Find all index.html, remove query hash of css and js files.
# e.g. <link rel ="stylesheet" href="screen.css%3Fblahblahblah" /> to <link rel ="stylesheet" href="screen.css" />
#      by replacing '%3Fblahblahblah"' with '"'
find dist -iname "index.html" -exec sed -i "s/\?.*\"/\"/" {} \;
echo "Done!"
