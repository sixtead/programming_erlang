-module(ex34).
-export([new/0, write/3, read/2, match/2, delete/2, reverse/1]).

new() -> [].

write(Key, Element, DataBase) ->
  [{Key, Element} | DataBase].

read(_, []) ->
  {error, instance};
read(Key, [{Key, Element} | _]) ->
  {ok, Element};
read(Key, [_ | DataBaseTail]) ->
  read(Key, DataBaseTail).
  
match(Element, DataBase) ->
  reverse(match(Element, DataBase, [])).
  
match(_, [], Return) ->
  Return;
match(Element, [{Key, Element} | DataBaseTail], Return) ->
  match(Element, DataBaseTail, [Key | Return]);
match(Element, [_ | DataBaseTail], Return) ->
  match(Element, DataBaseTail, Return).
  
delete(Key, DataBase) ->
  reverse(delete(Key, DataBase, [])).
  
delete(_, [], Return) ->
  Return;
delete(Key, [{Key, _} | Tail], Return) ->
  delete(Key, Tail, Return);
delete (Key, [Head | Tail], Return) ->
  delete(Key, Tail, [Head | Return]).
  
reverse(List) ->
  reverse(List, []).
  
reverse([], List) ->
  List;
reverse([Head|Tail], List) ->
  reverse(Tail, [Head|List]).