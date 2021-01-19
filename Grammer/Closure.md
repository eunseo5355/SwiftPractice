# 💡클로저 (Closure)

-   일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것입니다.
-   **일급 시민(first-citizen)** 으로, 전달인자, 변수, 상수 등으로 저장, 전달이 가능합니다.
-   **참조 타입** 입니다.
-   함수는 클로저의 일종으로, 이름이 있는 클로저입니다.

📌 **일급 객체(first-citizen)** 란?

전달인자로 전달할 수 있으며, 변수나 데이터 구조 안에 담을 수 있고 반환값으로 사용할 수 있는 객체을 말합니다.

## 클로저 표현방법

```Swift
{ (매개변수들) -> 반환 타입 in
	실행 코드
}
```

## 클로저의 사용

```Swift
// sum이라는 상수에 클로저 할당
let sum: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}

let sumResult: Int = sum(1, 2)
print(sumResult)

```

## 함수의 전달인자로서의 클로저

클로저는 주로 함수의 전달인자로 많이 사용됩니다.

```Swift
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) in
    return a + b
}
let substract: (Int, Int) -> Int
substract = { (a: Int, b: Int) in
    return a - b
}
let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) in
    return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    return method(a, b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)   // 60

// 따로 클로저를 상수/변수에 넣어 전달하지 않고,
// 함수를 호출할 때 클로저를 작성하여 전달할 수도 있습니다.
calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in 
	return left * right
})

print(calculated)   // 500

```

## 후행 클로저 (trailing closure)

-   클로저가 길어지거나 가독성이 떨어질 때 사용하면 좋습니다.
-   맨 마지막 전달인자로 전달되는 클로저에만 해당됩니다.
-   단 하나의 클로저만 전달인자로 전달하는 경우에는 소괄호를 생략해줄 수 있습니다.

```Swift
calculated = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}

print(calculated)   // 20
```

## 클로저 표현 간소화

### 1️⃣ 반환 타입 생략

```Swift
calculated = calculate(a: 10, b: 10) { (left: Int, right: Int) in
    return left + right
}

print(calculated)   // 20
```

calculated(a:b:method:) 함수의 method 매개변수가 Int 타입을 반환할 것이라는 사실을 컴파일러도 알기 때문에 굳이 반환 타입을 명시해 주지 않아도 됩니다.

### 2️⃣ 단축 인자 이름

클로저의 매개변수 이름이 불필요하다면 단축 인자 이름을 사용하면됩니다.

단축 인자 이름은 클로저의 매개변수의 순서대로 **$0, $1, $2, ...** 처럼 표현합니다.

```Swift
calculated = calculate(a: 10, b: 10) {
    return $0 + $1
}

print(calculated)   // 20
```

### 3️⃣ 암시적 반환 표현

클로저에서는 return 키워드도 생략해줄 수 있습니다.

```Swift
calculated = calculate(a: 10, b: 10) {
    $0 + $1
}
// 간결하게 한 줄로 표현해 줄 수도 있습니다.
calculated = calculate(a: 10, b: 10) { $0 + $1 }

print(calculated)   // 20
```

위와 같이 클로저가 **반환 값을 갖는 클로저** 이고 클로저 내부의 **실행문이 단 한 줄** 이라면, 암시적으로 그 실행문을 반환 값으로 사용할 수 있습니다.

## 값 획득

클로저는 자신이 정의된 위치의 주변 문맥을 통해 상수나 변수를 획득(Capture)할 수 있습니다.

```Swift
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
```

makeIntermenter 함수의 반환 타입인 () -> Int는 함수 객체를 반환한다는 의미입니다.

incrementer() 함수 주변에 runningTotal과 amount 변수가 있으므로 incrementer() 함수는 두 변수의 **참조** 를 획득할 수 있습니다.

따라서 두 변수는 makeIncrementer 함수의 실행이 끝나도 사라지지 않으며 incrementer가 호출될 때마다 계속해서 사용할 수 있습니다.

```Swift
let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)

// 함수가 따로 실행되어도 변수 amount와 runningTotal이 캡쳐되어 두 변수를 공유하기 때문에 누적된 결과를 가집니다.
let first: Int = incrementByTwo()   // 2
let second: Int = incrementByTwo()  // 4
let third: Int = incrementByTwo()   // 6

let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let ten: Int = incrementByTen()	// 10
let twenty: Int = incrementByTen()	// 20
```

위는 incrementByTwo가 상수로 선언되었지만 incrementByTwo가 호출될 때마다 runningTotal 변수가 계속해서 증가되었습니다. 그 이유는 바로 함수와 클로저가 **참조 타입** 이기 때문입니다.

따라서 클로저의 참조를 first, second, third처럼 각각 다른 상수에 할당해준다면 이는 세 상수가 모두 같은 클로저를 가리키고 있다는 뜻입니다.

또한, incrementByTen은 incrementByTwo와는 별개의 다른 참조를 갖는 runningTotal 변수값을 가지고있다는 것을 알 수 있습니다.
