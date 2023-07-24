-module(p09).
-export([pack/1]).

pack(L)->lists:reverse(pack(L,[])).

pack([], L) -> L;
pack([H], L) -> [[H] | L];
pack([H, H | _] = X, L) -> pack_duplicates(X, L, []);
pack([H, M | T], L) -> pack([M | T], [[H] | L]).

pack_duplicates([H, H | T], L, F) -> pack_duplicates([H | T], L, [H | F]);
pack_duplicates([H, M | T], L, F) -> pack([M | T], [[H | F] | L]);
pack_duplicates([H], L, F) -> pack([], [[H | F] | L]).