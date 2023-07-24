-module(p10).
-export([encode/1]).

encode(L) -> lists:reverse(encode(L, [])).

encode([], Acc) -> Acc;
encode([Head], Acc) -> [[Head] | Acc];
encode([Head, Head | _] = X, Acc) -> encode_key_value(X, Acc, 1);
encode([Head, Middle | Tail], Acc) -> encode([Middle | Tail], [{1, Head} | Acc]).

encode_key_value([Head, Head | Tail], Acc, Count) -> encode_key_value([Head | Tail], Acc, Count + 1);
encode_key_value([Head, Middle | Tail], Acc, Count) -> encode([Middle | Tail], [{Count, Head} | Acc]);
encode_key_value([Head], Acc, Count) -> encode([], [{Count, Head} | Acc]).