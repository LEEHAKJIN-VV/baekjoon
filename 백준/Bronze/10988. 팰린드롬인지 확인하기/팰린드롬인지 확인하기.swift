import Foundation

let strings: String = readLine()!
var answer: Int = 1

if strings.count == 2 && strings.first != strings.last{
    answer = 0
} else {
    let charArray: [Character] = Array(strings)
    let n: Int = charArray.count - 1
    for i in 0...n/2 {
        if charArray[i] != charArray[n - i] {
            answer = 0
            break
        }
    }
}

print(answer)
