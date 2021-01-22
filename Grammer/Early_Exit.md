# 💡빠른 종료 (Early Exit)

**guard** 키워드를 사용하여 특정 조건에 부합하지 않는다면 재빠르게 코드 블록의 실행을 종료할 수 있습니다.

guard 구문은 **Bool 타입의 값** 으로 동작하는 기능이며, 항상 else 구문이 뒤에 따라와야 합니다.

또한, guard의 else 블록 내부에는 특정 코드 블록을 종료하는 return, break, continue, throw 등의 **제어문 전환 명령** 이 꼭 있어야 합니다.

다음은 guard 구문 표현 방식입니다.

```Swift
guard Bool 타입 값 else {
	예외사항 실행문
    제어문 전환 명령어
}
```

if 구문을 사용하면 else 블록으로 예외사항을 처리해야 하지만

예외사항만 처리하고 싶다면 guard 구문을 사용하는 것이 훨씬 간편하고 읽기 좋게 구성할 수 있습니다.

```Swift
for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}
// 2
```

위와 같이 Bool 타입의 값으로 guard 구문을 동작시킬 수 있지만 **옵셔널 바인딩의 역할** 도 할 수 있습니다.

옵셔널의 값이 있는 상태라면 guard 구문에서 옵셔널 바인딩된 상수를 guard 구문이 실행된 아래 코드부터 함수 내부의 지역 상수처럼 사용할 수 있습니다.

```Swift
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "eunseo"

greet(personInfo)
// Hello eunseo
// I hope the weather is nice near you

personInfo["location"] = "Korea"

greet(personInfo)
// Hello eunseo
// I hope the weather is nice in Korea

```

guard 구문에서 좀 더 구체적인 조건을 추가하고 싶다면 **쉼표(,)** 로 추가조건을 나열해주면 됩니다.

```Swift
func enterClub(name: String?, age: Int?) {
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
        print("You are too young to enter the club")
        return
    }
    
    print("Welcome \(name)!")
}

enterClub(name: "jenny", age: 15)   //You are too young to enter the club
enterClub(name: "eunseo", age: 25)  // Welcome eunseo!
```

이렇게 쉼표로 추가된 조건은 AND 논리연산(&&)과 같은 결과를 줍니다.
