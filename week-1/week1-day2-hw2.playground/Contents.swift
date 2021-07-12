import UIKit

/**
 Project Euler
 2.Question
 */
 
var fib1 = 0, fib2 = 1

for _ in 1...10 {
    print(fib1 + fib2, terminator:",")
    (fib1,fib2) = (fib2,fib1+fib2)
}
