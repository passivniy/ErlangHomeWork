-module(p05).

-export([reverse/1]).

-include_lib("eunit/include/eunit.hrl").

reverse(L) -> reverse(L, []).

reverse([],[])->[];
reverse([],L) -> L;
reverse([H|T], L) -> reverse(T, [H|L]).

reverse_test_()->[
  reverse([1,2,3,4,5,6])=:=[6,5,4,3,2,1],
  reverse([1,2])=:=[2,1],
  reverse([])=:=[],
  reverse([1])=:=[1]
].