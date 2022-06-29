import Foundation

let n: Int = Int(readLine()!)!
let k: Int = Int(readLine()!)!
var cardList: [String] = []
var cardSet = Set<String>()

for _ in 0..<n {
    cardList.append(readLine()!)
}

permutation(&cardList,n,0,k)
print(cardSet.count)

func permutation(_ data: inout [String], _ n: Int, _ k: Int, _ r: Int) {
    if k==r {
        var tmp: String = ""
        for i in 0..<k {
            tmp += data[i]
        }
        cardSet.insert(tmp)
    }
    
    for i in k..<n {
        data.swapAt(i, k)
        permutation(&data, n, k+1,r)
        data.swapAt(i, k)
    }
}
