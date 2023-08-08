-module(p10).

-export([encode/1]).

-import(p05,[reverse/1]).

-include_lib("eunit/include/eunit.hrl").

encode(L) -> encode(L,[],1).

encode([],_,_) -> [];
encode([H],Acc,Count) -> reverse([{Count,H} | Acc]);
encode([H,H|T],Acc,Count) -> encode([H|T], Acc, Count+1);
encode([H,M|T],Acc,Count) -> encode([M|T],[{Count, H}|Acc],1).

encode_test_()->[
  encode([a,a,a,a,a,b,c,d,e,e,e])=:=[{5,a},{1,b},{1,c},{1,d},{3,e}],
  encode([a,b,c,d,e])=:=[{1,a},{1,b},{1,c},{1,d},{1,e}],
  encode([])=:=[]
].