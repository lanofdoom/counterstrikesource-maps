## Releases

* [Latest](https://lanofdoom.github.io/counterstrikesource-maps/releases/latest/maps.tar.xz) (2.0.0)
  * ``sv_downloadurl``: https://lanofdoom.github.io/counterstrikesource-maps/releases/latest/cstrike
* [Nightly](https://lanofdoom.github.io/counterstrikesource-maps/releases/nightly/maps.tar.xz)
  * ``sv_downloadurl``: https://lanofdoom.github.io/counterstrikesource-maps/releases/nightly/cstrike

## Installation
Extract ``maps.tar.xz`` into your server's ``css/cstrike`` directory.

Optionally, consider pointing your server's ``sv_downloadurl`` using the value corresponding with the version you've downloaded. This significant speeds up client map downloads and saves bandwidth on your server by leveraging GitHub's CDN for map downloads.

If setting ``sv_downloadurl``, you are also required to set ``sv_allowdownload 1`` and ``sv_allowupload 1``. You should also run the ``make_bz2_files.sh`` script in the archive in order to create the bz2 versions of the map data that are needed in order to use the HTTP mirror.

## Maps
* aim_ag_texture_city
* breakfloor
* cs_747_css
* cs_crackhouse
* cs_siege_2010
* de_thematrix_11
* de_westworld
* fun_allinone_css_v2
* fy_iceworld2k9
* fy_iceworld_cssource
* fy_poolday_reloaded
* fy_simpsons_h
* glasstrap_final
* scoutzknives

## Licensing
All maps included in the LAN of DOOM map pack have been licensed for redistribution. For details, see the license files included with the server tarball or the the license files in the map pack [repository](https://github.com/lanofdoom/counterstrikesource-maps).

## Version History

### 2.0.0 ([Download](https://lanofdoom.github.io/counterstrikesource-maps/releases/v2.0.0/maps.tar.xz))
* ``sv_downloadurl``: https://lanofdoom.github.io/counterstrikesource-maps/releases/v2.0.0/cstrike
* Remove bz2 version of maps from archive to decrease archive size
* Switch compression to xz in order to decrease archive size
* Add make_bz2_files.sh script for generating bz2 versions of map data
* Add cs_747_css
* Add css_crackhouse
* Add css_siege_2010
* Add de_thematrix_11
* Add de_westworld
* Add fun_allinone_css_v2
* Add fy_iceworld2k9
* Add fy_simpsons_h

### 1.0.0 ([Download](https://lanofdoom.github.io/counterstrikesource-maps/releases/v1.0.0/maps.tar.gz))
* ``sv_downloadurl``: https://lanofdoom.github.io/counterstrikesource-maps/releases/v1.0.0/cstrike
* Initial Release
