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
                if(o.count % 2 == 0) {
                    let sp = o.count / 2
                    let p1 = o.prefix(sp)
                    let p2 = o.suffix(sp)
                    print("o: \(o)")
                    print("sp: \(sp)")
                    print("p1: \(p1)")
                    print("p2: \(p2)")
                    if p1 == p2 {
                        print("p1 and p2 are the same")
                        total += i
                        print("new total: \(total)")
                    }
                }
            }
            print(total)
        }
    }
}

