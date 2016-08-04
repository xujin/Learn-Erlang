-module(lib_misc).
-export([for/3, qsort/1, pythag/1, perms/1, odds_and_evens1/1, odds_and_evens2/1, odds_and_evens3/1]).

for(Max, Max, F) 	-> [F(Max)];
for(I, Max, F)		-> [F(I)|for(I+1, Max, F)].

qsort([])			-> [];
qsort([Pivot|T])	->
	qsort([X || X <- T, X < Pivot])
	++ [Pivot] ++
	qsort([X || X <- T, X >= Pivot]).


pythag(N)	->
	[ {A, B, C} ||
		A <- lists:seq(1, N),
		B <- lists:seq(1, N),
		C <- lists:seq(1, N),
		A + B + C =< N,
		A * A + B * B =:= C * C
	].

perms([]) 	-> [[]];
perms(L)	-> [[H|T] || H <- L, T <- perms(L--[H])].


odds_and_evens1(L) ->
	Odds  = [X || X <- L, (X rem  2) =:= 1],
	Evens = [X || X <- L, (X rem  2) =:= 0],
	{Odds, Evens}.

odds_and_evens2(L) ->
	odds_and_evens_aac(L, [], []).

odds_and_evens_aac([H|T], Odds, Evens) ->
	case (H rem 2) of
		1 -> odds_and_evens_aac(T, [H|Odds], Evens);
		0 -> odds_and_evens_aac(T, Odds, [H|Evens])
	end;
odds_and_evens_aac([], Odds, Evens) ->
	{lists:reverse(Odds), lists:reverse(Evens)}.


odds_and_evens3(L) ->
	odds_and_evens_aac1(L, [], []).
odds_and_evens_aac1([H|T], Odds, Evens) ->
	case (H rem 2) of
		1 -> odds_and_evens_aac1(T, [H|Odds], Evens);
		0 -> odds_and_evens_aac1(T, Odds, [H|Evens])
	end;
odds_and_evens_aac1([], Odds, Evens) ->
	{lists:reverse(Odds), lists:reverse(Evens)}.