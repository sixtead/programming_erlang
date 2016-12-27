-module(ex32).
-export([create/1, create_reverse/1]).

create(N) when N < 0 ->
  lists:reverse(create(N, []));
create(N) ->
  create(N, []).

create(0, List) ->
  List;
create(N, List) when N < 0 ->
  create(N + 1, [N | List]);
create(N, List) ->
  create(N - 1, [N | List]).
  
create_reverse(N) ->
 lists:reverse(ex32:create(N)).