-module(p14).
-export([duplicate/1]).

duplicate(Acc) -> lists:reverse(duplicate(Acc, [])).

duplicate([], Acc) -> Acc;
duplicate([H | T], Acc) -> duplicate(T, [H, H | Acc]).