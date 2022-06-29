import Foundation

let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let n: Int = input[0], m: Int = input[1]
var strSet = Set<String>()

for _ in 0..<n {
    strSet.insert(readLine()!)
}
var count: Int = 0 // 집합 S에 포함된 문자열 수

for _ in 0..<m {
    if strSet.contains(readLine()!) {
        count += 1
    }
}

print(count)
