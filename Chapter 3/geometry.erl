-module(geometry).
-export([area/1]).

area({rectangle, Width, Height}) -> 
    Width * Height;
area({square, Side}) ->
    Side * Side;
% 计算圆面积
area({round, Radius}) ->
    3.1415 * Radius * Radius.