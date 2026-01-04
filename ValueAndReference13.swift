/*

🧩 Value Semantics (Structs, Enums)
Definition: When you assign or pass a value type, Swift copies it.

Examples: struct, enum, Array, Dictionary, String (all value types).

Behavior: Each variable has its own independent copy.

*/

/*
🧩 Reference Semantics (Classes)
Definition: When you assign or pass a reference type, Swift shares the same instance.

Examples: class, closures.

Behavior: Multiple variables can point to the same object.
*/

/*
🧩 Copy-on-Write (COW)
Swift optimizes value types with copy-on-write:

Instead of copying immediately, Swift shares storage until one copy is mutated.

On mutation, Swift creates a new copy to preserve value semantics.
*/

var arr1 = [1, 2, 3]
var arr2 = arr1   // no copy yet, both share storage
arr2.append(4)    // mutation triggers copy
print(arr1)       // [1, 2, 3]
print(arr2)       // [1, 2, 3, 4]


/*
🧩 When Mutation Triggers Copy
Mutation of one copy triggers a real copy.

Reading does not trigger a copy.

Example: arr2.append(4) above forces a copy because arr2 must diverge from arr1.
*/

/*
🧩 Performance Implications
    Value types (structs, enums):

    Safer (no shared mutable state).

    Efficient due to copy-on-write.

    Preferred for small, immutable models (e.g., SwiftUI views).

    Reference types (classes):

    Needed for shared state and inheritance.

    Can cause bugs if multiple references mutate the same object.

    ARC overhead (retain/release) can impact performance.
*/