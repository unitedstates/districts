### Create `us-congressional-districts.geojson` for current data
- Run `Create_US_Congressional_Districts.ps1` in the root folder, i.e. the folder `.ps1` is located in.
- Upload `us-congressional-districts.[year].geojson` as a Map in Einstein Analytics


## United States Districts

GeoJSON and other shape files for the federal legislative districts of the US.

Supported formats:

* GeoJSON
* KML

To do:

* Shapes for state legislative districts
* TopoJSON

## Using the shapes

All files in this repository are automatically published to [theunitedstates.io](https://theunitedstates.io), at predictable URLs.

For example, GeoJSON for New York's 1st district can be found at:

> [https://theunitedstates.io/districts/cds/2012/NY-1/shape.geojson](https://theunitedstates.io/districts/cds/2012/NY-1/shape.geojson)

The `2012` here refers to the year that these districts came into effect, and is the most current districts. "At Large" districts, where only 1 person represents an entire state or territory, are coded with a district number of `0` (e.g. `WY-0` and `PR-0`).

GeoJSON for the state of New York can be found at:

> [https://theunitedstates.io/districts/states/NY/shape.geojson](https://theunitedstates.io/districts/states/NY/shape.geojson)

Replace `.geojson` with `.kml` to get a KML version of a district.

You can also download [the entire set as a ZIP file](https://github.com/unitedstates/districts/archive/gh-pages.zip), and use them however you like. If you plan on using these for heavy traffic, or you want control over the domain name they live on, you should use this method.

### Crawling/discovering shape URLs

You can use the Github Repo Contents API to get a quick JSON view of each directory in the repository.

To see a list of all districts in the `cds/2012` directory, visit:

> [https://api.github.com/repos/unitedstates/districts/contents/cds/2012?ref=gh-pages](https://api.github.com/repos/unitedstates/districts/contents/cds/2012?ref=gh-pages)

To see a list of all states in the `states` directory, visit:

> [https://api.github.com/repos/unitedstates/districts/contents/states?ref=gh-pages](https://api.github.com/repos/unitedstates/districts/contents/states?ref=gh-pages)

## Other resources

Check out [mapshaper](https://github.com/mbloch/mapshaper) for all sorts of helpful map manipulation tools.

These are just static shapes for current districts. If you want to do more, you might use:

* Jeffrey B. Lewis' [collection of GeoJSON](https://github.com/JeffreyBLewis/congressional-district-boundaries) for every US congressional district, including historical shapes
* The [US Census Bureau's API](https://www.census.gov/developers/)
* GovTrack's [Boundary Service API](https://gis.govtrack.us/map/demo/cd-2012/)

## Public domain

This project is [dedicated to the public domain](LICENSE). As spelled out in [CONTRIBUTING](CONTRIBUTING.md):

> The project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
