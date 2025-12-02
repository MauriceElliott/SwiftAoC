import Foundation

struct Day02 {
    static func main() {
        let c = getContents("input/day2/input.txt")!
        let l = c.replacingOccurrences(of: "\n", with: "").split(separator: ",")
        var total = 0
        for r in l {
            let range = r.split(separator: "-")
            let start = Int(range.first!)!
            let end = Int(range.last!)!
            for i in start...end {
                let o = String(i)
                let sc = o.count
                if sc % 2 == 0 {
                    if sc == 2 && o.first == o.last {
                        total += i
                    } else if sc == 4 && (o.prefix(2) == o.suffix(2) || Set(o).count <= 1) {
                        total += i
                    }
                } else {
                    if Set(o).count <= 1 {
                        total += i
                    }
                }
            }
            print(total)
        }
    }
}

