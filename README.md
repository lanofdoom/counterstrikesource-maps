# LAN of Doom Counter-Strike: Source Maps

This is an archive of Counter-Strike Source maps for the LAN of Doom server.

Information about the author and license of each map can be found in the
`README.md` files in its subdirectory.

## Structure

Each map has all of it's data files organized into a `gamedir`-rooted top-level
folder. A map with a single .bsp file would end up at
`map_name/maps/map_name.bsp`.

To install the maps from this repository, the contents of each subdirectory
should be copied to the server's `gamedir` (eg `.../srcds/cstrike`).

## Installation
Extract maps.tar.xz into your server’s css/cstrike directory.

Optionally, consider pointing your server’s sv_downloadurl using the value
corresponding with the version you’ve downloaded. This significant speeds up
client map downloads and saves bandwidth on your server by leveraging GitHub’s
CDN for map downloads.

If setting sv_downloadurl, you are also required to set sv_allowdownload 1 and
sv_allowupload 1. For older versions of the map pack you should also run the
make_bz2_files.sh script in the archive in order to create the bz2 versions of
the map data that are needed in order to use the HTTP mirror.
