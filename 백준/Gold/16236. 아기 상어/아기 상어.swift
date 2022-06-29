import Foundation

struct Blank {
    private var loc: [Int]
    private var dis: Int
    
    init(_ loc: [Int], _ dis: Int) {
        self.loc = loc
        self.dis = dis
    }
    public func getLoc() -> [Int] {
        return self.loc
    }
    public func getDis() -> Int {
        return self.dis
    }
}

struct Queue<T> {
    private var items = [T]()
    private var size: Int = 0
    
    public mutating func enqueue(_ item: T) {
        items.append(item)
        size += 1
    }
    public mutating func dequeue() -> T? {
        if size == 0 {
            return nil
        }
        size -= 1
        
        var tmp: [T] = items.reversed()
        let returnValue: T = tmp.popLast()!
        items = tmp.reversed()
        return returnValue
    }
    public func peek() -> T? {
        if size == 0 {
            return nil
        }
        var tmp: [T] = items.reversed()
        let peekValue: T = tmp.popLast()!
        tmp.append(peekValue)
        return peekValue
    }
    
    public func getSize() -> Int {
        return size
    }
    public func getItemList() -> [T]? {
        return items.isEmpty ? nil : items
    }
}

let n: Int = Int(readLine()!)! // space size (n * n)
var space: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n) // 공간
var fishSizeList: [Int] = []
var sharkLoc: [Int] = [-1,-1] // 아기상어 위치
var sharkcale: Int = 2 // 아기상어 크기 -> init: [크기, 먹은 횟수]
var eatingCount: Int = 0 // 먹은 횟수

// input
for i in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<n {
        space[i][j] = input[j]
        if space[i][j] == 9 {
            sharkLoc = [i, j]
            space[i][j] = 0
        }
        else if space[i][j] != 0 {
            fishSizeList.append(space[i][j])
        }
    }
}

fishSizeList.sort()
var totalTime: Int = 0

while fishSizeList.count > 0 && binarySearch(fishSizeList, sharkcale) != 0 { // 현재 잡아먹을 물고기가 없다
    let moveTime: Int = bfs(n,&space)
    if moveTime == -1 {
        break
    }
    totalTime += moveTime
}
print(totalTime)


// 움직인 시간을 반ㄴ환
func bfs(_ n: Int, _ space: inout [[Int]]) -> Int {
    // init
    var queue = Queue<Blank>()
    queue.enqueue(Blank(sharkLoc, 0))
    let dir: [[Int]] = [[-1,0],[0,-1],[0,1],[1,0]] // 상어가 움직일 방향
    var movedTime: Int = Int.max
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    
    var nextFlag: Bool = false // 지금 상어가 방문한 위치에서 먹은 물고기가 있다. -> 현재 큐에 있는 애들까지만 비교
    var removeLoc: [Int] = [-1,-1] // init 먹을 물고기 위치
    var removeSize: Int = 0 // 먹을 물고기 크기
    
    outLoop: while queue.getSize() > 0 {
        if let curBlank: Blank = queue.dequeue() { // 현재 칸
            let curLoc: [Int] = curBlank.getLoc() // 현재 빈칸 위치
            let curDis: Int = curBlank.getDis() // 현재 움직인 거리
            
            for d in dir {
                let x: Int = curLoc[0] + d[0], y: Int = curLoc[1] + d[1] // 다음에 움직일 좌표
                if !checkBoard(x,y,visited) {
                    continue
                }
                visited[x][y] = true
                
                if space[x][y] == 0 || space[x][y] == sharkcale { // 지나 가기만
                    if !nextFlag{
                        queue.enqueue(Blank([x,y], curDis + 1))
                    }
                } else if space[x][y] < sharkcale { // 먹는다
                    nextFlag = true // 이제 큐에 넣지말아라
                    if movedTime < curDis {
                        continue
                    }
                    
                    if removeLoc.contains(-1) || findFishLoc(cur: [x,y], pre: removeLoc) { // 초기
                        removeLoc = [x,y]
                        removeSize = space[x][y]
                        movedTime = curDis
                    }
                }
            }
        }
    }
    if removeLoc.contains(-1) {
        return -1
    }
    
    updateFishList(removeSize)
    eatFish(removeLoc[0], removeLoc[1], &space)
    movedTime += 1
    return movedTime
}

func checkBoard(_ x: Int, _ y: Int, _ visited: [[Bool]]) -> Bool {
    if x < 0 || y < 0 || x > n - 1 || y > n - 1 {
        return false
    }

    if visited[x][y] {
        return false
    }
    return true
}

// 물고기 식사
func eatFish(_ x: Int, _ y: Int, _ space: inout [[Int]]) {
    space[x][y] = 0
    eatingCount += 1
    if eatingCount == sharkcale {
        sharkcale += 1
        eatingCount = 0
    }
    sharkLoc = [x,y]
}

// 물고기를 잡아 먹었으니 먹은 물고기를 리스트에서 제거
func updateFishList(_ size: Int) {
    var tmp: [Int] = []
    var flag: Bool = false
    for s in fishSizeList {
        if size != s { // 애는 안넣어야함
            tmp.append(s)
        } else if size == s && flag {
            tmp.append(s)
        } else if size == s && !flag {
            flag = true
        }
    }
    fishSizeList = tmp // 새로운 물고기 리스트
}

func binarySearch(_ data: [Int], _ target: Int) -> Int{
    var begin = 0, end = data.count

    while begin < end {
        let middle = (begin+end)/2
        if target <= data[middle] {
            end = middle
        } else {
            begin = middle + 1
        }
    }
    return end
}

// true -> 현재 물고기 위치가 더 가깝다 flase -> 이전 물고기 위치가 더 좋다
func findFishLoc(cur curLoc: [Int], pre preLoc: [Int]) -> Bool {
    if preLoc.contains(-1) {
        return true
    }
    
    if curLoc[0] < preLoc[0] { // 현재 위치가 더 위쪽
        return true
    } else if curLoc[0] == preLoc[0] { // 같은 줄에 있는 경우
        if curLoc[1] < preLoc[1] { // 현재 위치가 더 왼쪽
            return true
        }
    }
    
    return false
}
