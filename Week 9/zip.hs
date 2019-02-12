zip' :: [x] -> [y] -> [(x,y)]
zip' [] xs = []
zip' xs [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys