-module(p04).

-export([len/1]).

-include_lib("eunit/include/eunit.hrl").

len(L) -> len(L, 0).

len([_|T],X) -> len(T,X + 1);
len([],X) -> X.

len_test_()->[
  len([1,2,3,4,5,6])=:=6,
  len([1,a,b,c,4,d])=:=6,
  len([])=:=0
].