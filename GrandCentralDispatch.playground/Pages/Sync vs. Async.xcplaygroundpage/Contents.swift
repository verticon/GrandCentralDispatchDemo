//: [Overview](@previous)
import UIKit
import PlaygroundSupport
/*:
 The sync function waits, on the current thread, for the global thread to complete the work.
 */
//#-editable-code
func sync() {
    let queue = DispatchQueue.global()
    queue.sync {
        print("\tPerforming Synchonous Work on \(queue.label)")
    }
}
//#-end-editable-code
/*:
 The async function queues the work and returns without waiting.
 */
//#-editable-code
func async() {
    let queue = DispatchQueue.global()
    queue.async {
        print("\tPerforming Asynchonous Work on \(queue.label)")

    }
}
//#-end-editable-code
/*:
 By taking note of when the listener's final print statement executes relative to the work print statements you can confirm the synchronous vs. asynchronous execution of the work.
 */
//#-editable-code
let demo = Demo()
demo.buttonListener = { button in
    let action = Demo.Action(rawValue: button.tag)!
    print("\n\nProcessing \(action) action")
    
    switch action {
        
    case .sync: sync()
        
    case .async: async()
    }
    
    print("\(action) action processing completed")
}
//#-end-editable-code
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = demo
//: [Priority](@next)
