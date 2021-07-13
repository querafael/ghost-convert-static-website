## Ghost2Static
Docker version from fork of https://github.com/hanchiang/ghost-convert-static-website
Converts a Ghost blog to a Static Website.

## Introduction
This project contains scripts to convert a local ghost website into a static website, which can then be uploaded to a static web host.

## Features
1. Use `wget` to download target website into a static website
    1. Recursively download the entire website
    2. Recursive download sitemaps by first downloading `/sitemap.xml`, parsing and downloading the individual sitemap files
2. Remove query hash from `css` and `js` filename (*ghost specific*)
3. Replace query hash entities from `css` and `js` references in `index.html` files (*ghost specific*)
4. Replace http with https
5. Replace localhost links with live domain
6. Prettify url using directory name instead of index.html(e.g. /about instead of /about/index.html, / instead of /index.html)

## Usage
**Example**  
`ghost_server_domain:` localhost:2368  
`ghost_live_domain:` your-domain.com

```docker run -v ghost_dist:/converter/dist -e ghost_server_domain=localhost:2368 -e ghost_live_domain=your-domain.com```

## Output
A copy of the static website is written to the volume specified above.  
Upload it to a static web host!

## Notes
For some ghost templates it might be missing some of the image folders. You can copy it from your ghost server and place them inside your project