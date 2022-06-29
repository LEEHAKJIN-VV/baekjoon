import Foundation

let n: Int = Int(readLine()!)! // 팔린 책의 수
var bookInfo: [String:Int] = [:] // [책제목: 팔린수]

for _ in 0..<n {
    let title: String = readLine()!
    let count: Int = bookInfo[title] ?? 0
    bookInfo[title] = count + 1
}

let sortedBook = bookInfo.sorted(by: {
    a,b in
    if a.value != b.value {
        return a.value > b.value
    }
    return a.key < b.key
})

for (k,v) in sortedBook {
    print(k)
    break
}
