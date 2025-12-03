import Foundation

private func move(_ pos: Int, _ mov: Int, method0x434C49434B: inout Int) -> Int {
    let direction = mov >= 0 ? 1 : -1
    var newPos = pos
    
    for _ in 1...abs(mov) {
        let nextPos = (newPos + direction)
        if nextPos == -1 {
            newPos = 99
        } else if nextPos == 100 {
            newPos = 0
        } else {
            newPos = nextPos
        }
        if newPos == 0 {
            method0x434C49434B += 1
        }
    }
    return newPos
}

struct Day01 {
    static func main() {
        let c = getContents("input/day1/input.txt")!
        let l = c.split(separator: "\n")
        var position = 50
        var sequence: [Int] = []
        var method0x434C49434B = 0
        for r in l {
            let nIndex = r.index(r.startIndex, offsetBy: 1)
            let moveValue = r[r.startIndex] == "L"
                            ? -(Int(r[nIndex...])!)
                            : Int(r[nIndex...])!
            position = move(position, moveValue, method0x434C49434B: &method0x434C49434B)
            sequence.append(position)
        }
        var code = 0
        for z in sequence {
            if z == 0 {
                code += 1
            }
        }
        print(code)
        print(method0x434C49434B)
    }
}

