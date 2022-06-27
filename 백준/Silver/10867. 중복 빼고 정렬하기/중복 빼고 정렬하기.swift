let n: Int = Int(readLine()!)!
var numSet: Set = Set<Int>()

numSet = Set(readLine()!.split(separator: " ").map{Int($0)!})

for i in Array(numSet).sorted() {
    print(i, terminator: " ")
}
