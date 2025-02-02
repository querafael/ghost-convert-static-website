# make-offline-mirror-of-a-site-using-wget
# https://www.guyrutenberg.com/2014/05/02/make-offline-mirror-of-a-site-using-wget/

echo "Downloading from $1..."

mkdir -p dist
find dist -mindepth 1 ! -iname "README.md" ! -path "*.git*" -delete

# Download an offline copy of the local website
wget -mkEpnp $1

# get sitemap!
wget $1/sitemap.xml

# Awesome script to crawl sitemap.xml from: https://gist.github.com/pix0r/6083058
XML=`wget -O - --quiet $1/sitemap.xml`
URLS=`echo $XML | egrep -o "<loc>[^<>]*</loc>" | sed -e 's:</*loc>::g'`
echo $URLS | tr ' ' '\n' | wget -i - --wait=0.2 --random-wait -nv

# Remove xsl reference, cos `xml unsafe attempt to load url`?
sed -i "s/<?xml-stylesheet.*?>//" sitemap*;

mv $1/* dist
mv sitemap* dist

rm -r $1
echo "$1 downloaded!"
