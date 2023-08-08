-module(p07).

-export([flatten/1]).

-import(p05,[reverse/1]).

-include_lib("eunit/include/eunit.hrl").

flatten(L) -> reverse(flatten(L, [])).

flatten([],L) -> L;
flatten([[]|T],L) -> flatten(T,L);
flatten([[H|InnerT]|T],L) -> flatten([InnerT|T],flatten([H|T],L));
flatten([H|T],L) -> flatten(T,[H|L]).

flatten_test_()->[
  flatten([[1,1,[1,[2]],3,4,[4],[5,6,6]]])=:=[1,1,1,2,3,4,4,5,6,6],
  flatten([[[[[1]]]]])=:=[1],
  flatten([])=:=[]
].