import Foundation

@main
struct Main {
    static func main() {
        guard CommandLine.arguments.count > 1 else {
            print("Please provide a day number.")
            return
        }
        
        let day = CommandLine.arguments[1]
        
        switch day {
        case "1":
            Day01.main()
        default:
            print("Day \(day) not implemented yet.")
        }
    }
}
