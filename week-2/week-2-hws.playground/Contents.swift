import UIKit

/**
    if let - guard let kullanım tercihi neye göre belirlenir?
    if let ile nilden kurtarilip degiskene atanan deger sadece if blogu arasinda calisir
    guard let ise tanimlanan scope sonrasinda her yerde kullanilabilir. Eger nil degil ise program crash verir.
     
    guard let genellikle istenilen degerin kesin olarak nil olmamasi istendigi durumlarda ve programin surekliligini ve devamliligini saglayan bu  degiskenin nil duruma dusmemesinin kontrol edilmesi gerektigi zamanlarda kullanilir. Nil oldugu vakit program crash duruma gelir.
 
    iflet ise genelde anlik olarak nil degeri kontrollerinde kullanilir.Nil oldugunda genellikle programin crash vermesini etkileyecek duzeyde bir deger degildir.
 */

/**
 /// First Question
 /// Girilen bir sayının asal olup olmadığını bulan bir extension yazınız.
 */

extension Int {
    func isPrime() -> Bool {
        if self < 2{
            return false
        }else if self <= 3{
            return true
        }
        for i in 2...Int(sqrt(Double(self))) {
            if self % i == 0 {
                return false
            }
        }
        return true
    }
}

11.isPrime()

/**
 /// Second Question
 /// İki parametreli ve FARKLI tipli bir generic örneği yapınız... (T, U) ???
 */

func concatWithSpace<T: Numeric, U: Sequence>(first: T, second: U) -> [String] {
    var arr = [String]()
    //Append element by first parameter
    for i in second {
        arr.append("\(i) \(first)")
    }
    return arr
}

print(concatWithSpace(first: 45, second: ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig",2]))

/**
 Project Euler 6.Question
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */

func diffSumOfSquares(up to: Int) -> Int{
    // Sum of the squares formula is n * (n+1) * (2*n+1) / 6
    let sumOfTheSquares = to * (to + 1) * (2 * to + 1) / 6
    
    let squareOfSum = Int(pow(Double(to * (to + 1) / 2), Double(2)))
    
    return squareOfSum - sumOfTheSquares
}

print(diffSumOfSquares(up: 100)) //25164150

/**
 Project Euler 7.Question
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the 10 001st prime number?
 */

func stPrimeNumber(st: Int) -> Int{
    var count = 0

    for i in 2... {
        if i.isPrime() {
            count += 1
            // Return the prime number when the st number is equal to param value
            if count == st {
                return i
            }
        }
    }
    
    return 0
}

print(stPrimeNumber(st: 10001)) //104743

/**
 Static keyword neden kullanırız. Örnek bir kullanım yapınız
 */

class Student {
    var name: String
    var surname: String
    var no: Int
    static var `class`: String = "9-B"
    
    init(name: String, surname: String, no: Int) {
        self.name = name
        self.surname = surname
        self.no = no
    }
}

let student = Student(name: "samet", surname: "alemdaroglu", no: 1234)
print(student.surname) // must call the initializer method of student class
print(Student.class) // does not call an initializer method of student class


