unzip' :: [(x,y)] -> ([x], [y])
unzip' pairs = (map fst pairs, map snd pairs)