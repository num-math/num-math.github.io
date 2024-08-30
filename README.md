# Wepbage for the class Fundamentals of Numerical Mathematics (only in Czech) #


## How to edit ##

Edit `docs/index.html` and push to main. The result appears
on https://num-math.github.io/ in about one minute.


## How to serve from karlin.mff.cuni.cz domain ##

`cd` to `/usr/html/<username>` and add to (or create) `.htaccess`
the following lines
```
RewriteEngine On
Options +FollowSymlinks
RewriteBase /~<username>/
RewriteRule ^znm$ znm/ [R]
RewriteRule ^znm/index.html$ znm/ [R]
RewriteRule ^znm(.*)$ https://num-math.github.io/$1 [P]
```
Don't forget to substitute for `<username>` in all of the above cases.

The first two rewrite rules redirect `https://host/~<username>/znm` and
`https://host/~<username>/znm/index.html` to `https://host/~<username>/znm/`
(mind the terminal slash). The last rule proxies
`https://host/~<username>/znm<whatever>` to `https://num-math.github.io/<whatever>`.


## License ##

The textual and graphical contents (in `docs/index.html`, `docs/img`, etc.)
All rights reserved.
(C) 2023–2024 MFF UK

The HTML template CC BY 3.0 made with :heart: by [Colorlib](https://colorlib.com)

Included stylesheets, JavaScript, and fonts licensed as MIT and SIL Open Font License
