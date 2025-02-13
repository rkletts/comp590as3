-module(p2).
-export([start/0]).

% team: [Maria Thomas & Reese Letts]

start() ->
    io:format("Welcome! Enter numbers to process (0 to exit).~n"),
    loop().

loop() ->
    case io:read("Enter a number: ") of
        {ok, 0} ->
            io:format("Exiting...~n"),
            ok;
        {ok, Num} when is_integer(Num) ->
            compute_result(Num),
            loop();
        _ ->
            io:format("not an integer~n"),
            loop()
    end.

compute_result(0) ->
    io:format("0~n");


compute_result(Num) when Num < 0 ->
    Result = math:pow(abs(Num), 7),
    io:format("Absolute value to the 7th power: ~w~n", [Result]);

compute_result(Num) when Num > 0, Num rem 7 =:= 0 ->
    Root5 = math:pow(Num, 1/5),
    io:format("5th root: ~w~n", [Root5]);

compute_result(Num) when Num > 0 ->
    io:format("Factorial: ~w~n", [factorial(Num)]).


factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).
