type spreadsheet
type sheet
type range

module Cell : sig 
    type t
    type cell = Int of int | String of string
    val classify : t -> cell
end = struct
    type t
    external rawCellToFloat: t -> int = "%identity"
    external rawCellToString: t -> string = "%identity"
    type cell = Int of int | String of string
    let classify (cell: t) = match (Js.typeof cell) with
        | "string" -> String (rawCellToString cell) 
        | _ -> Int (rawCellToFloat cell)
end


external getActiveSpreadsheet : unit -> spreadsheet = "getActiveSpreadsheet" [@@bs.val][@@bs.scope "SpreadsheetApp"]
external getSheets : spreadsheet -> sheet array = "getSheets" [@@bs.send]
external getSheetByName : spreadsheet -> string -> sheet = "getSheetByName" [@@bs.send]
external getDataRange : sheet -> range = "getDataRange"  [@@bs.send]
external getName : sheet -> string = "getName"  [@@bs.send]
external getValues : range -> Cell.t array array = "getValues"  [@@bs.send]
let getAllValues sheet =  getDataRange sheet |. getValues
