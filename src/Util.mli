type row = Sheet.Cell.t array
type sheet = row array
type sheet_map = int Standard.Map.String.t 
type exclude_list = string array
val mergeMap : string -> int option -> int option -> int option
val foldMapSheets : sheet_map array -> sheet_map
val toMap : sheet -> sheet_map
val pick_columns : (int * int) -> row -> (string * int) option 
val sumSheets : sheet array -> (string * int) array
val sumAllSheets : excluded: exclude_list -> (string * int) array
val getData : string -> Sheet.Cell.cell array array
val getSheetsDataExcept :  excluded: exclude_list -> sheet array