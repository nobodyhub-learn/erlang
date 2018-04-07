%%%-------------------------------------------------------------------
%%% @author Ryan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Jan 2018 7:32 PM
%%%-------------------------------------------------------------------
-module(afile_server).
-author("Ryan").

%% API
-export([start/1, loop/1]).
-compile([debug_info]).

start(Dir) ->
  spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  receive
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)}, io:format(list_dir);
    {Client, {get_file, File}} ->
      Full = filename:join(Dir, File), Client ! {self(), file:read_file(Full)}, io:format(get_file);
    true ->
      io:format("looping")
  end,
  loop(Dir).


