module Number_or_string : sig 
    type t 
    type case = 
        | Int of int 
        | String of string
    val classify : t -> case             
end 
type row = Number_or_string.t array
type sheet = row array
type sheet_map = int Standard.Map.String.t 
val mergeMap : string -> int option -> int option -> int option
val foldMapSheets : sheet_map array -> sheet_map
val toMap : sheet -> sheet_map
val pick_columns : (int * int) -> row -> (string * int) option 
val sumSheets : sheet array -> (string * int) array