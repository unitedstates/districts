#!/usr/bin/env node

/**
 *
 */

var fs = require('fs');
var path = require('path');
var pj = function() { return path.join.apply(null, arguments); }

var statesDir = pj(__dirname, 'states');
var states = fs.readdirSync(statesDir);
var fiftys = states.filter(function (state) {
  try {
    var hasUpper = fs.statSync(pj(statesDir, state, 'sldu')).isDirectory();
    var hasLower = fs.statSync(pj(statesDir, state, 'sldl')).isDirectory();
    return hasUpper && hasLower;
  } catch (e) { return false; }
});

console.log("Found", fiftys.length, "states to process.");


function reduceState(state) {
  console.log("Upper: Reading");
  var upperDir = pj(statesDir, state, 'sldu');
  var upperDs = fs.readdirSync(upperDir);
  var upperGeoJSON = upperDs.reduce(function (gJ, d) {
    var district = JSON.parse(fs.readFileSync(pj(upperDir, d), 'utf-8'));
    return gJ.features.push(district), gJ;
  }, { type: 'FeatureCollection', features: [] });
  console.log("Upper: Writing");
  fs.writeFileSync(pj(upperDir, 'sldu.json'), JSON.stringify(upperGeoJSON));
  
  console.log("Lower: Reading");
  var lowerDir = pj(statesDir, state, 'sldl');
  var lowerDs = fs.readdirSync(lowerDir);
  var lowerGeoJSON = lowerDs.reduce(function (gJ, d) {
    var district = JSON.parse(fs.readFileSync(pj(lowerDir, d), 'utf-8'));
    return gJ.features.push(district), gJ;
  }, { type: 'FeatureCollection', features: [] });
  console.log("Lower: Writing");
  fs.writeFileSync(pj(lowerDir, 'sldl.json'), JSON.stringify(lowerGeoJSON));
}

fiftys.forEach(function (state) {
  console.log("Processing state", state);
  reduceState(state);
});
