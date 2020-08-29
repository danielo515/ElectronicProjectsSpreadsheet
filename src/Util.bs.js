// Generated by BUCKLESCRIPT, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Standard = require("reason-standard/bucklescript/src/Standard.bs.js");
var Sheet$ElectronicProjectsSpreadsheet = require("./Sheet.bs.js");

function pick_columns(param, row) {
  var match = Sheet$ElectronicProjectsSpreadsheet.Cell.classify(Standard.$$Array.get(row, param[0]));
  var match$1 = Sheet$ElectronicProjectsSpreadsheet.Cell.classify(Standard.$$Array.get(row, param[1]));
  if (match.tag && !match$1.tag) {
    return /* tuple */[
            match[0],
            match$1[0]
          ];
  }
  
}

function toMap(sheet) {
  var partial_arg = /* tuple */[
    0,
    1
  ];
  return Curry._1(Standard.$$Map.$$String.ofArray, Standard.$$Array.filterMap(sheet, (function (param) {
                    return pick_columns(partial_arg, param);
                  })));
}

function mergeMap(_key, a, b) {
  return Standard.$$Option.$pipe$question(a, 0) + Standard.$$Option.$pipe$question(b, 0) | 0;
}

var func = Standard.$$Map.merge;

function sumMaps(param) {
  var func$1 = Curry._1(func, param);
  return (function (param) {
      return Curry._2(func$1, param, mergeMap);
    });
}

var func$1 = Standard.$$Array.fold;

var arg = Standard.$$Map.$$String.empty;

function foldMapSheets(param) {
  return Curry._3(func$1, param, arg, sumMaps);
}

function sumSheets(sheets) {
  return Standard.$$Map.toArray(foldMapSheets(Standard.$$Array.map(sheets, toMap)));
}

function getData(sheetName) {
  var func = Standard.$$Array.map;
  var arg = Sheet$ElectronicProjectsSpreadsheet.Cell.classify;
  return Standard.$$Array.map(SpreadsheetApp.getActiveSpreadsheet().getSheetByName(sheetName).getDataRange().getValues(), (function (param) {
                return Curry._2(func, param, arg);
              }));
}

exports.mergeMap = mergeMap;
exports.foldMapSheets = foldMapSheets;
exports.toMap = toMap;
exports.pick_columns = pick_columns;
exports.sumSheets = sumSheets;
exports.getData = getData;
/* Standard Not a pure module */
