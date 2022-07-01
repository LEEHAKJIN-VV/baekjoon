import Foundation


let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let n: Int = input[0], k: Int = input[1]
let heatList: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var maxSum: Int = Int.min

// 총 n - k + 1번 비교

// init
var sum: Int = 0
var front: Int = 0
var rear: Int = k

for i in 0..<rear {
    sum += heatList[i]
}
maxSum = max(maxSum, sum)

if rear == heatList.count {
    maxSum = sum
} else {
    while rear < heatList.count {
        sum -= heatList[front]
        sum += heatList[rear]
        maxSum = max(maxSum, sum)
        front += 1
        rear += 1
    }
}
print(maxSum)

