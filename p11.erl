-module(p11).
-export([encode_modified/1]).

encode_modified(L) -> lists:reverse(encode_modified(L, [])).

encode_modified([], Acc) -> Acc;
encode_modified([Head], Acc) -> [[Head] | Acc];
encode_modified([Head, Head | _] = X, Acc) -> encode_key_value(X, Acc, 1);
encode_modified([Head, Middle | Tail], Acc) -> encode_modified([Middle | Tail], [Head | Acc]).

encode_key_value([Head, Head | Tail], Acc, Count) -> encode_key_value([Head | Tail], Acc, Count + 1);
encode_key_value([Head, Middle | Tail], Acc, Count) -> encode_modified([Middle | Tail], [{Count, Head} | Acc]);
encode_key_value([Head], Acc, Count) -> encode_modified([], [{Count, Head} | Acc]).