mergeSort :: Ord t => [t] -> [t]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort firstHalf) (mergeSort secondHalf)
    where middle = length xs `quot` 2
          (firstHalf, secondHalf) = splitAt middle xs
          merge [] xs = xs
          merge xs [] = xs
          merge (x:xs)(y:ys)
            | x < y = x : merge xs (y:ys)
            | otherwise  = y : merge (x:xs) ys