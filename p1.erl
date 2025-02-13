-module(p1).
-export([process_number/0, factorial/1]).

# -team("reese letts, maria thomas").

process_number() -> 
    {ok, Num} = io:read("Enter a number: "),
    if
        not is_integer(Num) -> io:format("not an integer~n");
        Num < 0 -> 
            Result = math:pow(abs(Num), 7),
            io:format("~w raised to the 7th power is: ~w~n", [abs(Num), Result]);
        Num == 0 -> io:format("0~n");
        Num > 0 -> 
            if
                Num rem 7 == 0 -> 
                    Root = math:pow(Num, 1/5),
                    io:format("The 5th root of ~w is: ~w~n", [Num, Root]);
                true -> 
                    Fact = factorial(Num),
                    io:format("The factorial of ~w is: ~w~n", [Num, Fact])
            end
    end.

factorial(0) -> 1;
factorial(N) when N > 0 -> N * factorial(N - 1).

