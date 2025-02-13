-module(number_processor).
-export([start/0, process_number/1, factorial/1]).

start() ->
    loop().

loop() ->
    {ok, Num} = io:read("Enter a number: "),
    if
        not is_integer(Num) ->
            io:format("not an integer~n"),
            loop();
        Num < 0 -> 
            Result = math:pow(abs(Num), 7),
            io:format("~w raised to the 7th power is: ~w~n", [abs(Num), Result]),
            loop();
        Num == 0 ->
            io:format("0~n");
        Num > 0 ->
            if
                Num rem 7 == 0 ->
                    Root = math:pow(Num, 1/5),
                    io:format("The 5th root of ~w is: ~w~n", [Num, Root]),
                    loop();
                true ->
                    Fact = factorial(Num),
                    io:format("The factorial of ~w is: ~w~n", [Num, Fact]),
                    loop()
            end
    end.

factorial(0) -> 1;
factorial(N) when N > 0 -> N * factorial(N - 1).
