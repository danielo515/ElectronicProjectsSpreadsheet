open Standard

type row = Sheet.Cell.t array
type sheet = row array
type sheet_map = int Standard.Map.String.t 

let pick_columns (a,b) (row: row): (string * int) option =
  let open Sheet.Cell in
  match classify(row.(a)), classify(row.(b)) with
  | String x, Int y -> Some (x, y)
  | _ -> None


let toMap sheet : sheet_map = 
  (Array.filterMap sheet ~f:(pick_columns (0,1))) 
  |> Map.String.ofArray

let mergeMap _key a b = 
  Option.( 
    Some((a|?0) + (b|?0))
  ) 

let sumMaps = Map.merge ~f:mergeMap
let foldMapSheets = Array.fold ~f:sumMaps ~initial:Map.String.empty


let sumSheets sheets = 
  Array.map sheets ~f:toMap 
  |. foldMapSheets
  |. Map.toArray

let getData sheetName = let open Sheet in 
  getActiveSpreadsheet ()
  |. getSheetByName sheetName
  |. getDataRange
  |. getValues
  |. Array.map ~f:(Array.map ~f:Sheet.Cell.classify)