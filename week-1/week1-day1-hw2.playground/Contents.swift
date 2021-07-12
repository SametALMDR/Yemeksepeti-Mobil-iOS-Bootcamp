import UIKit

var str = "I felt happy because I saw the others were happy and because I knew I should feel happy, but I wasn’t really happy."

func countWords(myStr:inout String) -> [String:Int] {
    var wordDict = [String:Int]()
    let words = myStr.components(separatedBy:" ")
    for word in words {
        wordDict[word.trimmingCharacters(in: .punctuationCharacters), default:0] += 1
    }
    return wordDict
}

print(countWords(myStr: &str))
