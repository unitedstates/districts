# Run this in the root directory

# get last last feature by name
$featuresByName = @{}

foreach($folder in Get-ChildItem -Directory -Path ".\cds\*\*") {
    $districts = $folder.Name -split "-"
    $district = "$($districts[0])-$($districts[1].PadLeft(2, '0'))"

    $featuresByName[$district] = @{
        id = $district
        name = $district
        type = "Feature"
        geometry = (Get-Content -Raw -Path "$($folder.FullName)\shape.geojson" | ConvertFrom-Json).geometry
    }
}

# save output geojson
$lastYear = (Get-ChildItem -Directory -Path ".\cds\*" | Select-Object -Last 1).Name

$geojson = @{
    features = $featuresByName.values | Sort-Object -Property id
}

ConvertTo-Json -InputObject $geojson -Depth 8 | Out-File "us-congressional-districts.$($lastYear).geojson"