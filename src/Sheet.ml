type spreadsheet
type sheet
type range
external getActiveSpreadsheet : unit -> spreadsheet = "getActiveSpreadsheet" [@@bs.val][@@bs.scope "SpreadsheetApp"]
external getSheets : spreadsheet -> sheet array = "getSheets" [@@bs.send]
external getSheetByName : spreadsheet -> string -> sheet = "getSheetByName" [@@bs.send]
external getDataRange : sheet -> range = "getDataRange"  [@@bs.send]
external getValues : range -> 'a array array = "getValues"  [@@bs.send]