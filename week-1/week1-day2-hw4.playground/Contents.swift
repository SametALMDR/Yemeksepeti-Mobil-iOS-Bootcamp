import UIKit

func largestPalindromeProduct(digit: Int) -> Int {
    
    let lowestNum  = Int(pow(10.0, Double(digit - 1)))
    let highestNum = Int(pow(10.0, Double(digit))) - 1
    
    var num: Int
    for i in stride(from: highestNum, through: lowestNum, by: -1) {
        for k in stride(from: highestNum, through: lowestNum, by: -1) {
            num = i*k
            if String(num) == String(String(num).reversed()) {
                return num
            }
        }
    }
    return 0
}

print(largestPalindromeProduct(digit: 3))
