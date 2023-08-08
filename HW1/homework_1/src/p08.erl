-module(p08).

-export([compress/1]).

-import(p05,[reverse/1]).

-include_lib("eunit/include/eunit.hrl").

compress(L)->compress(L,[]).

compress([],_)-> [];
compress([H],L)->reverse([H|L]);
compress([H,H|T],L) ->
  compress([H|T],L);
compress([H,M|T],L) ->
  compress([M|T],[H|L]).

compress_test_()->[
  compress([1,1,2,2,3,4,5,6])=:=[1,2,3,4,5,6],
  compress([1,1,1,1,1,2,3,7,8])=:=[1,2,3,7,8],
  compress([])=:=[]
].