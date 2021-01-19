// sum이라는 상수에 클로저 할당
let sum: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}

let sumResult: Int = sum(1, 2)
print(sumResult) // 3

typealias IntType = (Int, Int) -> Int

let add: IntType
add = { (a: Int, b: Int) in
    return a + b
}
let substract: IntType
substract = { (a: Int, b: Int) in
    return a - b
}
let divide: IntType
divide = { (a: Int, b: Int) in
    return a / b
}

func calculate(a: Int, b: Int, method: IntType) -> Int {
    return method(a, b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)   // 60

// 따로 클로저를 상수/변수에 넣어 전달하지 않고,
// 함수를 호출할 때 클로저를 작성하여 전달할 수도 있습니다.
calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
                        return left * right})

print(calculated)   // 500

// 후행 클로저 구현
calculated = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

print(calculated)   // 20

//----------------------------------------------------------------------------

// 값 획득

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)

let first: Int = incrementByTwo()   // 2
let second: Int = incrementByTwo()  // 4
let third: Int = incrementByTwo()   // 6

let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let ten: Int = incrementByTen()
let twenty: Int = incrementByTen()

