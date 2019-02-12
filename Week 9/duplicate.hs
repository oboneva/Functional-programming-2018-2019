duplicate :: Eq t => [t] -> [t] 
duplicate [] = []
duplicate [t] = [t,t]
duplicate (x:xs) = x : x : duplicate xs