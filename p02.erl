-module(p02).
-export([but_last/1]).

but_last([H, M] = X) -> X;
but_last([_, _ | T]) -> but_last(T).