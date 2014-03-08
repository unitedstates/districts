## United States Districts

GeoJSON and other shape files for the federal legislative districts of the US.

Supported formats:

* GeoJSON
* KML

To do:

* Shapes for state legislative districts
* TopoJSON

## Using the shapes

All files in this repository are automatically published to [theunitedstates.io](http://theunitedstates.io), at predictable URLs.

For example, GeoJSON for New York's 1st district can be found at:

> [http://theunitedstates.io/districts/cds/2012/NY-1/shape.geojson](http://theunitedstates.io/districts/cds/2012/NY-1/shape.geojson)

The `2012` here refers to the year that these districts came into effect, and is the most current districts. "At Large" districts, where only 1 person represents an entire state or territory, are coded with a district number of `0` (e.g. `WY-0` and `PR-0`).

GeoJSON for the state of New York can be found at:

> [http://theunitedstates.io/districts/states/NY/shape.geojson](http://theunitedstates.io/districts/states/NY/shape.geojson)

Replace `.geojson` with `.kml` to get a KML version of a district.

You can also download [the entire set as a ZIP file](https://github.com/unitedstates/districts/archive/gh-pages.zip), and use them however you like. If you plan on using these for heavy traffic, or you want control over the domain name they live on, you should use this method.

We **cannot provide HTTPS permalinks** for these GeoJSON files, as Github Pages does not support SSL. If you want to use these files on your website and worry about showing your users mixed content warnings, you'll need to host them elsewhere. If this seems weird to you, [write Github support](mailto:support@github.com) to request SSL support for Github Pages.

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
* The [US Census Bureau's API](http://www.census.gov/developers/)
* GovTrack's [Boundary Service API](http://gis.govtrack.us/map/demo/cd-2012/)

## Public domain

This project is [dedicated to the public domain](LICENSE). As spelled out in [CONTRIBUTING](CONTRIBUTING.md):

> The project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](http://creativecommons.org/publicdomain/zero/1.0/).

> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
