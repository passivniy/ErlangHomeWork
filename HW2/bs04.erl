-module(bs04).
-export([decode/1]).

decode(Acc)->lists:reverse(decode(Acc,<<>>,<<>>,[])).

decode(<<"[{",H/utf8,Rest/binary>>,_TempBinary1,TempBinary2,ResultAcc)->
    decode_members(<<"{",H/utf8,Rest/binary>>,<<>>,<<>>,TempBinary2,[],[],ResultAcc);
decode(<<"{",H/utf8,Rest/binary>>,_TempBinary1,_TempBinary2,ResultAcc)->
    decode(<<H/utf8,Rest/binary>>,<<>>,<<>>,ResultAcc);
decode(<<"': ",H/utf8,Rest/binary>>,TempBinary1,_TempBinary2,ResultAcc)->
    decode(<<H/utf8,Rest/binary>>,<<>>,TempBinary1,ResultAcc);
decode(<<",",H/utf8,Rest/binary>>,TempBinary1,TempBinary2,ResultAcc)->
    decode(<<H/utf8,Rest/binary>>,<<>>,<<>>,[{<<TempBinary2/binary>>,<<TempBinary1/binary>>}|ResultAcc]);
decode(<<"',",H/utf8,Rest/binary>>,TempBinary1,TempBinary2,ResultAcc)->
    decode(<<H/utf8,Rest/binary>>,<<>>,<<>>,[{<<TempBinary2/binary>>,<<TempBinary1/binary>>}|ResultAcc]);
decode(<<>>,<<>>,<<>>,ResultAcc)->ResultAcc;
decode(<<"'",H/utf8,Rest/binary>>,TempBinary1,TempBinary2,ResultAcc)->
    decode(<<Rest/binary>>,<<TempBinary1/binary,H/utf8>>,TempBinary2,ResultAcc);
decode(<<H/utf8,Rest/binary>>,TempBinary1,TempBinary2,ResultAcc)->
    decode(<<Rest/binary>>,<<TempBinary1/binary,H/utf8>>,TempBinary2,ResultAcc);
decode(<<>>,TempBinary1,TempBinary2,ResultAcc)->[{<<TempBinary2/binary>>,<<TempBinary1/binary>>}|ResultAcc].

decode_members(<<"{'",H/utf8,Rest/binary>>,_TempBinary1,_TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode_members(<<H/utf8,Rest/binary>>,<<>>,<<>>,TempBinary3,Member,ListOfMembers,ResultAcc);
decode_members(<<"': ['",Rest/binary>>,TempBinary1,_TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode_powers(<<Rest/binary>>,<<>>,TempBinary1,TempBinary3,[],Member,ListOfMembers,ResultAcc);
decode_members(<<"': '",H/utf8,Rest/binary>>,TempBinary1,_TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode_members(<<H/utf8,Rest/binary>>,<<>>,TempBinary1,TempBinary3,Member,ListOfMembers,ResultAcc);
decode_members(<<"': ",H/utf8,Rest/binary>>,TempBinary1,_TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode_members(<<H/utf8,Rest/binary>>,<<>>,TempBinary1,TempBinary3,Member,ListOfMembers,ResultAcc);
decode_members(<<",'",H/utf8,Rest/binary>>,TempBinary1,TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode_members(<<H/utf8,Rest/binary>>,<<>>,<<>>,TempBinary3,[{<<TempBinary2/binary>>,<<TempBinary1/binary>>}|Member],ListOfMembers,ResultAcc);
decode_members(<<"','",H/utf8,Rest/binary>>,TempBinary1,TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode_members(<<H/utf8,Rest/binary>>,<<>>,<<>>,TempBinary3,[{<<TempBinary2/binary>>,<<TempBinary1/binary>>}|Member],ListOfMembers,ResultAcc);
decode_members(<<"}}",Rest/binary>>,TempBinary1,TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode(<<Rest/binary>>,<<>>,<<>>,[{<<TempBinary3/binary>>,ListOfMembers}|ResultAcc]);
decode_members(<<H/utf8,Rest/binary>>,TempBinary1,TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc)->
    decode_members(<<Rest/binary>>,<<TempBinary1/binary,H/utf8>>,TempBinary2,TempBinary3,Member,ListOfMembers,ResultAcc).

decode_powers(<<"','",Rest/binary>>,TempBinary1,TempBinary2,TempBinary3,ListOfPower,Member,ListOfMembers,ResultAcc)->
    decode_powers(<<Rest/binary>>,<<>>,TempBinary2,TempBinary3,[<<TempBinary1/binary>>|ListOfPower],Member,ListOfMembers,ResultAcc);
decode_powers(<<"']",Rest/binary>>,TempBinary1,TempBinary2,TempBinary3,ListOfPower,Member,ListOfMembers,ResultAcc)->
    decode_members(<<Rest/binary>>,<<>>,TempBinary2,TempBinary3,[],[lists:reverse([{<<TempBinary2/binary>>,[<<TempBinary1/binary>>|ListOfPower]}|Member])|ListOfMembers],ResultAcc);
decode_powers(<<H/utf8,Rest/binary>>,TempBinary1,TempBinary2,TempBinary3,ListOfPower,Member,ListOfMembers,ResultAcc)->
    decode_powers(<<Rest/binary>>,<<TempBinary1/binary,H/utf8>>,TempBinary2,TempBinary3,ListOfPower,Member,ListOfMembers,ResultAcc).