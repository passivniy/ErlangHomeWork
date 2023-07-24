-module(p04).
-export([len/1]).

len(L) -> len(L, 0).

len([_ | T], X) -> len(T, X + 1);
len([], X) -> X.