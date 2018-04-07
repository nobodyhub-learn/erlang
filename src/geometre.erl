%%%-------------------------------------------------------------------
%%% @author Ryan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Jan 2018 10:07 PM
%%%-------------------------------------------------------------------
-module(geometre).
-author("Ryan").

%% API
-export([area/1, test/0]).

test() ->
  area({rectangle,1,2}).

area({rectangle, Width, Height}) ->
  Width * Height;
area({square, Side}) ->
  Side * Side;
area({circle, Radius}) ->
  3.14159 * Radius * Radius.

