import Foundation

// input
let n: Int = Int(readLine()!)!
let m: Int = Int(readLine()!)!
var raw: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let range: Int = raw.count
var count: Int = 0

if n == 1 && raw[0] == m{
    print(1)
} else {
    // sort
    raw.sort(by: { a,b in a > b })
    // search
    for i in 0..<range - 1 {
        for j in i+1..<range {
            if raw[i] + raw[j] == m {
                count += 1
            } else if raw[i] + raw[j] < m {
                break
            }
        }
    }
    print(count)
}
