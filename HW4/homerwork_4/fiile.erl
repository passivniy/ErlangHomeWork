-module(fiile).

%% API
-export([start_link/2,init/1,insert/4,handle_call/3]).

-record(state , {drop_interval}).

start_link(_TableName,Options)->
  io:format("~n~p~n~n",[[_TableName,Options]]),
  gen_server:start_link(?MODULE,[_TableName,Options],[]).

init(Args)->
  io:format("~nARGS  =  ~p~n~n",[Args]),
  [_TableName,[{_,Time}]] = Args,
  ets:new(_TableName,[set,public,named_table]),
  {ok,#state{drop_interval=Time}}.

insert(TableName,Key,Value,Timer)->
  gen_server:call(?MODULE,{insert,TableName,Key,Value,Timer}).

handle_call({insert,TableName,_Key,Value,Timer},_,_)->
  ets:insert(TableName,{_Key,Value,Timer,get_current_time()}).

get_current_time()->
  calendar:universal_time().
