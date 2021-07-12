import UIKit

/**
 Project Euler
 1.Question 1.Solution
 */
let n = 1000
var sum = 0

for n in 1..<n {
    if n % 3 == 0 || n % 5 == 0 {
        sum += n
    }
}
print(sum)

/**
 Project Euler
 1.Question 2.Solution
 */
func countSum(number: Int) -> Int {
    var sum: Int = 0
    for n in 1...(number/3) {
        if number > 3*n {
            sum += 3*n
        }
        if number > 5*n {
            sum += 5*n
        }
        if number > 15*n {
            sum -= 15*n
        }
    }
    return sum
}

print(countSum(number: 1000))
