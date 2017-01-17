//: [Sync vs. Async](@previous)
import PlaygroundSupport
import Foundation
/*:
 The doWork function is representative of some long running work that we might want to accomplish in our applications. doWork does not do anything useful; it executes a busy loop in order to occupy the time of the thread upon which it is executing.
 */
//#-editable-code
func doWork(name: String) {
    let timer = Timer(name: name, indent: false)

    var sum: Double = 0
    for operand in 1...50000 {
        sum += sqrt(Double(operand))
    }

    timer.done()
}
//#-end-editable-code
/*:
 The playNice function demonstrates that when long running work is moved to another thread the UI is able to remain responsive.
 */
//#-editable-code
func playNice() {
    DispatchQueue.global().async {
        doWork(name: "Nice Work")
    }
}
//#-end-editable-code
/*:
 The playRude function demonstrates that when long running work is performed on the main thread the UI becomes unresponsive.
 */
//#-editable-code
func playRude() {
    doWork(name: "Rude Work")
}
//#-end-editable-code
/*:
 */
//#-editable-code
let demo = Demo()
demo.buttonListener = { button in
    let action = Demo.Action(rawValue: button.tag)!
    
    switch action {

    case .playNice: playNice()

    case .playRude: playRude()
    
    case .changeColor: // Tap the color button to determine whether or not the UI is responding.
        let color = getNextColor()
        button.setBackgroundColor(color, forState: .normal)
        button.setTitleColor(color == .black || color == .blue ? .white : .black, for: .normal)
    }
}
//#-end-editable-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = demo
//: [Concurrency](@next)
