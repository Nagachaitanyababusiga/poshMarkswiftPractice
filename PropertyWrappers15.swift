/*
🧩 What are Property Wrappers?
A property wrapper is a generic structure that encapsulates logic for how a property is stored and accessed.

Declared with @WrapperName before a property.

Provides a wrappedValue (the actual property) and can add extra behavior (validation, persistence, etc.).

🧩 Built-in Wrappers in SwiftUI
@State → Local state for a view.

@Published → Publishes changes to subscribers (Combine).

@ObservedObject → Observes an external object’s changes.

@EnvironmentObject → Injects shared data into views.

@AppStorage → Stores values in UserDefaults.

*/

/*
🧩 1. @State → Local state for a view
Used for private, view‑local state.

SwiftUI manages its lifecycle.

👉 @State is owned by the view. When count changes, the view re‑renders.

*/

struct CounterView: View {
    @State private var count = 0   // local state
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1
            }
        }
    }
}


/*
🧩 2. @Published → Publishes changes to subscribers (Combine)
Used inside an ObservableObject.

Automatically notifies subscribers when the property changes.

👉 @Published works with Combine — SwiftUI listens and updates the view when the property changes.

*/

class CounterModel: ObservableObject {
    @Published var count = 0   // publishes changes
}

struct CounterView: View {
    @ObservedObject var model = CounterModel()
    
    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            Button("Increment") {
                model.count += 1
            }
        }
    }
}


/*
🧩 3. @ObservedObject → Observes an external object’s changes
Used in a view to observe an ObservableObject.

The view re‑renders when any @Published property changes.

👉 @ObservedObject is not owned by the view — you pass it in from outside.

*/

struct CounterView: View {
    @ObservedObject var model: CounterModel   // external object
    
    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            Button("Increment") {
                model.count += 1
            }
        }
    }
}


/*
🧩 4. @EnvironmentObject → Injects shared data into views
Used for global/shared state across many views.

Provided via .environmentObject() modifier.

👉 @EnvironmentObject is like dependency injection — no need to pass objects manually through every initializer.

*/

class Settings: ObservableObject {
    @Published var theme = "Light"
}

struct ThemeView: View {
    @EnvironmentObject var settings: Settings   // injected globally
    
    var body: some View {
        Text("Current theme: \(settings.theme)")
    }
}

// Usage in root view
ThemeView()
    .environmentObject(Settings())


/*
🧩 Binding vs State Binding Differences
@State
Owns the data.

Best for local, private state inside a view.
@Binding
Does not own the data — it’s a reference to state owned elsewhere.

Used to pass state down to child views.
👉 @State = owner of the data.
👉 @Binding = reference to someone else’s @State.

@State vs @Binding is a common trick question:

@State owns the data.

@Binding references data owned elsewhere.

@Published + @ObservedObject → external state management.

@EnvironmentObject → dependency injection for shared state.

*/

struct ChildView: View {
    @Binding var count: Int   // reference to parent’s state
    
    var body: some View {
        Button("Increment") {
            count += 1
        }
    }
}

struct ParentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
            ChildView(count: $count)   // pass binding
        }
    }
}


//@Published + @ObservedObject vs @Published + @StateObject


//@Published + @ObservedObject 
class CounterModel: ObservableObject {
    @Published var count = 0
}

struct CounterView: View {
    @ObservedObject var model: CounterModel   // external object
    
    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            Button("Increment") { model.count += 1 }
        }
    }
}


// @Published + @stateObject 
class CounterModel: ObservableObject {
    @Published var count = 0
}

struct CounterView: View {
    @StateObject private var model = CounterModel()   // owned by this view
    
    var body: some View {
        VStack {
            Text("Count: \(model.count)")
            Button("Increment") { model.count += 1 }
        }
    }
}

/*
Both rely on @Published inside the ObservableObject to trigger updates.

Difference is lifecycle management:

@ObservedObject → external ownership.

@StateObject → internal ownership.

Common trap: If you use @ObservedObject when the view should own the object, you’ll see unexpected resets when the view redraws.

Best practice:

Use @StateObject when the view creates the model.

Use @ObservedObject when the model is injected from outside.

*/