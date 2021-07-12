import UIKit

func isPrime(num: Int) -> Bool {
    if (num <= 1) {
        return false
    }
    for n in stride(from: 2, through: sqrt(Double(num)), by: 1) {
        if num % Int(n) == 0 {
            return false
        }
    }
    return true
}

func largestPrime(number: Int) -> Int {
    var largest = 2
    if number < 2 {
        return largest
    }
    for n in 2...number {
        if number % n == 0 && isPrime(num: n){
            if n > largest {
                largest = n
            }
        }
    }
    return largest
}

print(largestPrime(number: 13195))
print(largestPrime(number: 600851475143))

