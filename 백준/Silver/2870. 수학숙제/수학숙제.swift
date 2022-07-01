import Foundation

let n: Int = Int(readLine()!)! // 숫자의 개수
var numList: [String] = []

// input
for _ in 0..<n {
    findNumber(readLine()!)
}

let sortedList = numList.sorted(by: {
    (a: String, b: String) in
    
    if a.count == b.count { // 길이가 같은 경우
        return a < b
    } else { // 길이가 다른 경우
        return a.count < b.count
    }
})

for number in sortedList {
    print(number)
}

func findNumber(_ strings: String) {
    var num: String = ""
    
    for ch in strings {
        if ch.isNumber { // 현재 문자가 숫자인 경우
            num += String(ch)
            if num.hasPrefix("0") && num.count > 1 { // 숫자가 2자리 이상이면서 제일 첫 문자가 0이면 제거
                num.removeFirst()
            }
        } else {
            if !num.isEmpty {
                numList.append(num)
                num = ""
            }
        }
    }
    if !num.isEmpty {
        numList.append(num)
    }
}

