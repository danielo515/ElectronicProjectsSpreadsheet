open Standard
module Number_or_string = struct
  type t = Any : 'a -> t 
    [@@unboxed]     
    type case = 
        | Int of int 
        | String of string
    let classify (Any v : t) : case = 
        if Js.typeof v = "number" then Int (Obj.magic v  : int)
        else String (Obj.magic v : string)
end

type row = Number_or_string.t array
type sheet = row array
type sheet_map = int Standard.Map.String.t 

let pick_columns (a,b) (row: row): (string * int) option =
  match Number_or_string.classify(row.(a)), Number_or_string.classify(row.(b)) with
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
