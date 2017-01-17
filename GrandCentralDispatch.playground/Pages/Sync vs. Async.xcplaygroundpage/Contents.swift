//: [Overview](@previous)
import UIKit
import PlaygroundSupport
/*:
 The sync function queues the work and waits for it to be executed. When the work is dequeued it will be executed on the current thread; i.e. the caller's thread. When the work has completed the call to queue.sync will return.
 */
//#-editable-code
func sync() {
    let caller = Thread.current
    let queue = DispatchQueue.global()
    queue.sync {
        print("\tPerforming synchonous work for caller \(caller) from queue \(queue.label) on thread \(Thread.current)")
    }
}
//#-end-editable-code
/*:
 The async function queues the work and returns without waiting. When the work is dequeued it will be executed on some other thread. Note the use of the DispatchTime to delay the execution. Without this things can get tricky: the system could choose to execute the work prior to the return from queue.async() and thus make it appear that the work had been performed synchronously.
 */
//#-editable-code
func async() {
    let caller = Thread.current
    let queue = DispatchQueue.global()
    let when: DispatchTime = .now() + .milliseconds(100)
    queue.asyncAfter(deadline: when) {
    //queue.async {
        print("\tPerforming asynchonous work for caller \(caller) from queue \(queue.label) on thread \(Thread.current)")
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
//: [UI Responsiveness](@next)
