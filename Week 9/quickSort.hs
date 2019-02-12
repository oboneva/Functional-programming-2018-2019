quickSort :: Ord t => [t] -> [t]
quickSort [] = []
quickSort (pivot: others) = quickSort smaller ++ (pivot : quickSort larger)
    where smaller = filter (<= pivot) others
          larger = filter (> pivot) others