import UIKit

func smallestMultiple(n: Int) -> Int {
    
    var multiplers = [Int:Int]()
    var myPrimes = [Int:Int]()
    for i in 1...n {
        multiplers = getMultipliers(num: i)
        for k in multiplers {
            if myPrimes[k.key] != k.value {
                myPrimes[k.key] = k.value
            }
        }
    }
    var number = 1
    for i in myPrimes {
        number *= Int(pow(Double(i.key), Double(i.value)))
    }
    return number
}

func getMultipliers(num: Int) -> [Int:Int] {
    var number = num
    var arr = [Int:Int]()
    for i in 1...num {
        if number % i == 0 {
            arr[i, default: 0] += 1
            number /= i
        }
    }
    if number != 1 {
        arr[number,default: 0] += 1
    }
    return arr
}

print(smallestMultiple(n: 20))

