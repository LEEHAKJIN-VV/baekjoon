import Foundation

let t: Int = Int(readLine()!)!

for _ in 0..<t { // test case input
    // input
    let command: String = readLine()! // ex) RDD
    let arrayCount: Int = Int(readLine()!)!
    var strings: String = readLine()!
    strings.removeFirst()
    strings.removeLast()
    
    var data: [Int] = []
    if !strings.isEmpty {
        data = strings.split(separator: ",").map{Int(String($0))!}
    }

    var rCount: Int = 0
    var flag: Bool = true // true면 첫문자 삭제 false면 마지막 문자 삭제
    var lIndex: Int = 0
    var rIndex: Int = data.count
    
    if lIndex >= rIndex {
        exceptionCase(data,command)
        continue
    }
    
    
    for oper in command {
        if oper == "R" {
            rCount += 1
            flag = (flag) ? false : true
        } else {
            if flag {
                lIndex += 1
            } else {
                rIndex -= 1
            }
        }
    }
 
    if lIndex < rIndex {
        data = Array(data[lIndex..<rIndex])
        if rCount % 2 == 1{
            data.reverse()
        }
        printResult(data)
    } else if lIndex == rIndex {
        print("[]")
    } else {
        print("error")
    }
}

func exceptionCase(_ data: [Int], _ command: String) {
    let dCount = command.filter{$0=="D"}.count
    let dataCount: Int = data.count
    if dataCount < dCount {
        // error
        print("error")
    } else if dataCount == dCount {
        print("[]")
        // prints []
    } else {
        let rCount = command.filter{$0=="R"}.count
        if rCount % 2 == 1{
            printResult(data.reversed())
        } else {
            printResult(data)
        }
    }
    
}

func printResult(_ data: [Int]) {
    if data.count == 0 {
        print("[]")
        return
    }
    
    var output: String = "["
    for n in data {
        output += String(n) + ","
    }
    output.removeLast()
    output += "]"
    print(output)
}
