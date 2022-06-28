import Foundation

let input: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
let n: Int = input[0], k: Int = input[1]

var medalInfo: [Int: [Int]] = [:]

for _ in 0..<n {
    let info: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    medalInfo[info[0]] = [info[1],info[2],info[3]]
}

let sortedCountry = medalInfo.sorted(by: {
    a,b in
    if a.value[0] != b.value[0] { // 금
        return a.value[0] > b.value[0]
    } else if a.value[1] != b.value[1] { // 은
        return a.value[1] > b.value[1]
    } else {
        return a.value[2] > b.value[2]
    }
})

var grade: Int = 1
var count: Int = 1
var beforeGrade: Int = 0
var beforeMedalInfo: [Int] = []

for (key, value) in sortedCountry {
    if beforeMedalInfo != value {
        grade = count
        beforeMedalInfo = value
    }
    if key == k {
        break
    }
    
    count += 1
}

print(grade)
