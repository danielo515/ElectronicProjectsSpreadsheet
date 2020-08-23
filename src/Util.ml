open Tablecloth

let pick_columns (a,b) row =
  (row[a], row[b])

let toMap sheet = 
  (Array.map sheet ~f:(pick_columns (0,1))) 
  (* |> Map.String.fromArray *)