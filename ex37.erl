-module(ex37).
-export([new/0, write/3, read/2, match/2, delete/2, reverse/1]).

new() -> [].

write(Key, Element, DataBase) ->
  lists:append(DataBase, [{Key, Element}]).

read(Key, DataBase) ->
  case lists:keyfind(Key, 1, DataBase) of
    {Key, _Value} ->
      {ok, _Value};
    false ->
      {error, instance}
  end.
      
match(Element, DataBase) ->
  match(Element, DataBase, []).
  
match(_, [], List) ->
  lists:reverse(List);
match(Element, [H|T], List) ->
  case lists:keyfind(Element, 2, [H]) of
    {_Key, Element} ->
      match(Element, T, [_Key|List]);
    false ->
      match(Element, T, List)
  end.
  
delete(Key, DataBase) ->
  lists:keydelete(Key, 1, DataBase).
  
reverse(List) ->
  lists:reverse(List).
