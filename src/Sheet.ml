open Standard
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

let maxArrLn arrs: int = 
 let open Array in
 fold arrs ~initial:0 ~f:(fun max curr -> if max > (length curr) then max else length curr)

external getActiveSpreadsheet : unit -> spreadsheet = "getActiveSpreadsheet" [@@bs.val][@@bs.scope "SpreadsheetApp"]
external getSheets : spreadsheet -> sheet array = "getSheets" [@@bs.send]
external getSheetByName : spreadsheet -> string -> sheet = "getSheetByName" [@@bs.send]
external getDataRange : sheet -> range = "getDataRange"  [@@bs.send]
external getRange : sheet -> row: int -> col: int -> numRows: int -> numCols: int -> range = "getRange"  [@@bs.send]
external getName : sheet -> string = "getName"  [@@bs.send]
external getValues : range -> Cell.t array array = "getValues"  [@@bs.send]
external setValues: range -> Cell.t array array -> unit = "setValues"  [@@bs.send]
let getAllValues sheet =  getDataRange sheet |. getValues
let writeToSheet data ~name ~row ~col = 
    let numRows = Array.length data in
    let numCols = maxArrLn data in
    getActiveSpreadsheet () 
    |. getSheetByName name
    |. getRange ~row ~col ~numRows ~numCols 
    |. setValues data