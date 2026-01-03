//array

var arr: [Int]=[1,2,3,4,5]

arr[0]=0
arr.append(6)
arr.remove(at: 2)
arr.removeLast()

for i in arr{
    print(i)
}

print(arr.count)
print(arr.map{$0*2})
print(arr)
print(arr.compactMap{Int($0)})

//sets
var set1: Set<Int> = Set<Int>();
var set2: Set<Int> = Set<Int>();
for _ in 1...4{
    set1.insert(Int.random(in: 1...6))
    set2.insert(Int.random(in: 1...6))
}
print(set1)
print(set2)

print(set1.contains(1))
print(set1.isEmpty)

print("random order")

for i in set1{
    print(i)
}

print("sorted order")

for i in set1.sorted(){
    print(i)
}

/*
Set algebra
Union: s.union(t) / s.formUnion(t)

Intersection: s.intersection(t) / s.formIntersection(t)

Symmetric difference: s.symmetricDifference(t) / formSymmetricDifference

Subtracting: s.subtracting(t) / s.subtract(t)

Subset/superset: s.isSubset(of: t), s.isSuperset(of: t)

Disjoint: s.isDisjoint(with: t)

*/

//Dictonary

var dict: [Int:Int] = [1:1,2:2,3:3]
print(dict[1] ?? "no value")

//to remove
dict[1]=nil

for (key,value) in dict{
    print("\(key) : \(value)")
}

for key in dict.keys{
    print(key)
}

for value in dict.values{
    print(value)
}

// higher order funtions in swift

//map
print(arr.map{$0*$0}) // creates square of every number

//compactmap
print(arr.compactMap{Int($0)}) //no nil values

//flatmap
let nestarr=[[1,2,3],[1,2,3],[2,3,4]]
print(nestarr.flatMap{$0})

//filter
print(arr.filter{$0%2==0})

//reduce
print(arr.reduce(0,+))
print(arr.reduce(0){
    return $0+$1
})

//forEach
arr.forEach{print($0)}

//sorted
print(arr.sorted())

//enumarated
for (index,value) in arr.enumerated(){
    print("at \(index): \(value)")
}