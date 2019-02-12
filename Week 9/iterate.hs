iterate' :: (t -> t) -> t -> [t]
iterate' func base = base : iterate' func (func base)