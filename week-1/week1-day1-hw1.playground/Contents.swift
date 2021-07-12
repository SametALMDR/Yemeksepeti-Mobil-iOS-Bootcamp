import UIKit

var str = "aaba kouq bux"

func removeChars(myStr:inout String, count: Int) -> String {
    var strDict = [Character:Int]()
    for char in myStr {
        strDict[char, default:0] += 1
    }
    for char in strDict {
        if char.value >= count && char.key != " " {
            myStr = myStr.replacingOccurrences(of: String(char.key), with: "")
        }
    }
    myStr = myStr.trimmingCharacters(in: .whitespacesAndNewlines)
    return myStr
}

print(removeChars(myStr: &str,count: 2))
