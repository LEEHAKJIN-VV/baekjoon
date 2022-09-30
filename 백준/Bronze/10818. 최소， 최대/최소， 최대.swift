import Foundation

let n: Int = Int(readLine()!)! // 정수 개수
let intArray: [Int] = readLine()!.split(separator: " ").map{Int($0)!} // [정수...]

print(intArray.min()!, intArray.max()!) // O(n) + O(n)