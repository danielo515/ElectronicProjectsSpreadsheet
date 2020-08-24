type col = String of string | Int of int
type row = col array
type sheet = row array
type sheet_map = int Standard.Map.String.t 
val mergeMap : string -> int option -> int option -> int option
val foldMapSheets : sheet_map array -> sheet_map
val sumSheets : sheet array -> (string * int) array