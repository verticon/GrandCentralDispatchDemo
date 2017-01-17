//: [UI Access](@previous)
import UIKit
import PlaygroundSupport
/*:
 The performStep function is representative of some long running work that we might want to accomplish in our applications. doWork does not do anything useful; it executes a busy loop in order to occupy the time of the thread upon which it is executing.
 */
//#-editable-code
public func performStep(name: String) {
    let timer = Timer(name: name, indent: true)

    var sum: Double = 0
    for operand in 1...25000 {
        sum += sqrt(Double(operand))
    }

    timer.done()
}
//#-end-editable-code
/*:
 The inlineProcedure function demonstrates what happens when all of the procedure's steps are the caller's thread.
 */
//#-editable-code
func inlineProcedure(numberOfSteps: Int) {
    let timer = Timer(name: "Inline Tasks", indent: false)

    for i in 1...numberOfSteps {
        performStep(name: "Task \(i)")
    }

    timer.done()
}
//#-end-editable-code
/*:
 The queuedProcedure function demonstrates what happens when the procedure's steps are performed on another queue. If the destination queue is a serial queue then the execution time will be roughly the same as that exhibited by the inlineProcedure function. However, if the destination queue is a concurent queue then the execution time will be greatly reduced due to the use of multiple concurrent threads, i.e. multiple cores. Additionaly, the queuedProcedure function demonstrates the use of a DispatchGroup to determine when all of the steps have completed.
 */
//#-editable-code
func queuedProcedure(queue: DispatchQueue, numberOfSteps: Int) {
    let group = DispatchGroup()
    let timer = Timer(name: "\(queue.label) Tasks", indent: false)

    for i in 1...numberOfSteps {
        group.enter()
        queue.async {
            performStep(name: "Task \(i)")
            group.leave()
        }
    }

    group.notify(queue: DispatchQueue.main) {
        timer.done()
    }
}
//#-end-editable-code
/*:
 Try varying the submissions argument for the concurrent case. What happens when the number of submissions exeeds the number of cpu cores?
 */
//#-editable-code
let demo = Demo()
demo.buttonListener = { button in
    let action = Demo.Action(rawValue: button.tag)!
    print("\n\nProcessing \(action) action")

    switch action {

    case .inline: inlineProcedure(numberOfSteps: 3)

    case .serial: queuedProcedure(queue: DispatchQueue(label: "My Serial Queue"), numberOfSteps: 3) // Dispatch queues are serial unless otherwise specified.

    case .concurrent: queuedProcedure(queue: DispatchQueue.global(), numberOfSteps: 3) // The global dispatch queues are concurrent.
    }

    print("\n\(action) action processing completed")
}
//#-end-editable-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = demo
//: [Quality of Service](@next)
