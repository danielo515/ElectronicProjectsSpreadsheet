open Standard

let pick_columns (a,b) row =
  ((Array.get row a), Array.get row b)

let toMap sheet = 
  (Array.map sheet ~f:(pick_columns (0,1))) 
  |> Map.String.ofArray