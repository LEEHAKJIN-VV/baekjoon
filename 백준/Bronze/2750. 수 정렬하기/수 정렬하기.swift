import Foundation

let n: Int = Int(readLine()!)!

var numArray: [Int] = Array(repeating: 0, count: n)

for i in 0..<n {
    numArray[i] = Int(readLine()!)!
}

for num in numArray.sorted() {
    print(num)
}
