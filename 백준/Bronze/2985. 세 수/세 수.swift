import Foundation

let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let numList: [[Int]] = [input, [input[2], input[1], input[0]]]
let operate: [Character] = ["+","-","*","/"]

let result = findEquat(numList)
let op: Character = result.op
let num: [Int] = result.num
let index: Int = result.index
var output: String = ""
if index == 0{
    output = "\(num[0])=\(num[1])\(op)\(num[2])"
} else if index == 1 {
    output = "\(num[2])\(op)\(num[1])=\(num[0])"
} else { output = "Error" }
print(output)

func findEquat(_ numList: [[Int]]) -> (num: [Int], op: Character, index: Int){
    for i in 0...1 {
        let n1: Int = numList[i][0], n2: Int = numList[i][1], n3: Int = numList[i][2]
        var result: Int = 0
        
        for op in operate {
            switch op {
            case "+":
                result = n2 + n3
                break
            case "-":
                result = n2 - n3
                break
            case "*":
                result = n2 * n3
                break
            case "/":
                result = n2 / n3
                break
            default:
                break
            }
            if result == n1 {
                return ([n1,n2,n3], op, i)
            }
        }
    }
    return ([-1,-1,-1], "@", 2)
}
