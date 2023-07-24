-module(p08).
-export([compress/1]).

compress(L) -> lists:reverse(compress(L, [])).

compress([], L) ->
  L;
compress([H, H | T], L) ->
  compress([H | T], L);
compress([H], L) ->
  compress([], [H | L]);
compress([H, M | T], L) ->
  compress([M | T], [H | L]).