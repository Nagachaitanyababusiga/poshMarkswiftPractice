/*
1. 🧩 Grand Central Dispatch (GCD)
Low-level C API for managing concurrent tasks.

In Swift, you use DispatchQueue to schedule work.
*/
import Dispatch

DispatchQueue.global().async {
    print("Background work")
}
DispatchQueue.main.async {
    print("UI update on main thread")
}


/*
2. 🧩 DispatchQueue
Main queue → runs on the main thread (UI updates must happen here).

Global/background queues → run tasks concurrently in the background.

Custom queues → you can create your own serial or concurrent queues.
*/

let queue = DispatchQueue(label: "com.example.myqueue")
queue.async {
    print("Task on custom queue")
}


/*
3. 🧩 Sync vs Async
sync → blocks the current thread until the task finishes.

async → schedules the task and returns immediately.
*/

DispatchQueue.global().sync {
    print("Runs synchronously")
}
DispatchQueue.global().async {
    print("Runs asynchronously")
}

/*
🧩 Swift Concurrency (Modern Approach)
Introduced in Swift 5.5, built on structured concurrency.

1. async / await
Makes asynchronous code look like synchronous code.

async marks a function as asynchronous.

await suspends execution until the async task completes.
*/

func fetchData() async -> String {
    return "Data loaded"
}

Task {
    let result = await fetchData()
    print(result)
}

/*
2. Task
Represents a unit of asynchronous work.

Can be created explicitly with Task { ... }.

Supports cancellation.
*/

Task {
    await doWork()
}

/*
3. Actors
Special reference types that protect their mutable state.

Guarantee thread safety by serializing access to their properties.
*/

actor Counter {
    var value = 0
    func increment() {
        value += 1
    }
}

let counter = Counter()
Task {
    await counter.increment()
}

//👉 Actors solve the data race problem in concurrent code.

/*
🧩 What is @MainActor?
An attribute you can apply to functions, properties, or entire types.

Guarantees that the annotated code executes on the main thread.

Useful because UIKit/AppKit/SwiftUI require UI work to happen on the main thread.
*/

@MainActor
func updateUI() {
    // Always runs on main thread
    print("Updating UI safely")
}
