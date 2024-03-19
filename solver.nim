# calculator.nim

import strutils

proc readNumber(prompt: string): float =
    echo prompt
    result = parseFloat(readLine(stdin))

proc calculate(op: char, a, b: float): float =
    case op
    of '+': return a + b
    of '-': return a - b
    of '*': return a * b
    of '/': return a / b
    else: raise newException(ValueError, "Invalid operator")

proc main() =
    echo "Welcome to the Nim Calculator!"
    let num1 = readNumber("Enter the first number: ")
    let num2 = readNumber("Enter the second number: ")

    echo "Available operations:"
    echo " + : Addition"
    echo " - : Subtraction"
    echo " * : Multiplication"
    echo " / : Division"

    let operator = readLine(stdin)[0]

    try:
        let result = calculate(operator, num1, num2)
        echo "Result: ", result
    except ValueError:
        echo "Invalid operator. Please choose +, -, *, or /."

when isMainModule:
    main()
