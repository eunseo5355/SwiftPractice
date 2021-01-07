## 💡함수 선언의 기본 형태

스위프트에서 함수를 정의하는 키워드는 **func** 입니다.

이를 사용한 함수의 기본 형태는 다음과 같습니다.

```Swift
func 함수 이름(매개변수1이름: 타입, 매개변수2이름: 타입 ...) -> 반환 타입 {
	실행 구문
    return 반환 값
}
```


### 기본 형태의 함수 정의와 호출

```Swift
func greet(name: String) -> String {
	let greeting = "Hello, " + name + "!"
    return greeting
}

let helloJenny: Sting = greet(name: "Jenny")
print(helloJenny) // Hello, Jenny!
```

이를 더 간단하게 다음과 같이 구현할 수 있습니다.

```Swift
func greeting(name: String) -> String {
	return "Hello, \(name)!"
}

print(greeting(name: "Anna")) // Hello, Anna!
```

위와 같은 방법으로 함수를 정의할 수 있지만

함수 내부의 코드가 단 한 줄의 표현이고, 그 표현의 결괏값의 타입이 함수의 반환 타입과 일치한다면 return 키워드를 생략해줄 수 있습니다.

```Swift
func greeting(name: String) -> String {
	"Hello, \(name)!"
}

print(greeting(name: "Anna")) // Hello, Anna!
```


### 반환이 없는 함수

반환 값이 없는 함수라면 반환 타입을 '없음'을 의미하는 **Void** 로 표기하거나 아예 반환 타입 표현을 생략해줄 수 있습니다.

```Swift
func helloWorld() {
	print("Hello, World!")
}
helloWorld() // Hello, World!

// 반환 타입을 Void로 명시해줘도 상관없음
func goodBye() -> Void {
	print("Good bye")
}
goodBye() // Good bye

func greeting(from myName: String, to name: String) {
	print("Hello \(name)! I'm \(myName)!")
}
greeting(from: "Anna", to: "Tim") // Hello Tim! I'm Anna!
```
---


## 💡매개변수

함수를 정의할 때 외부로부터 받아들이는 전달 값의 이름을 의미합니다.



## 💡전달인자(Argument)

함수를 실제로 호출할 때 전달하는 값을 의미합니다.



### 매개변수가 없는 함수

함수에 매개변수가 필요 없다면 매개변수 위치를 공란으로 비워둡니다.

```
func helloWorld() -> String {
	return "Hello, world"
}

print(helloWorld()) // Hello, world
```

### 매개변수가 여러 개인 함수

매개변수가 여러 개인 함수를 정의할 때는 쉼표(,)로 매개변수를 구분합니다.

호출 시에는 매개변수 이름(Parameter Name)을 붙여주고 콜론(:)을 적어준 후 전달인자를 보내줍니다.

```Swift
func greeting(myName: String, yourName: Sting) -> String {
	return "Hello \(yourName)! I'm \(myName)"
}

print(greeting(myName: "Anna", yourName: "Tim")) // Hello Tim! I'm Anna
```

### 매개변수 이름과 전달인자 레이블

함수를 정의할 때 매개변수 이름과 더불어 전달인자 레이블을 지정해줄 수 있습니다.

매개변수 이름과 전달인자 레이블을 같은 이름으로 사용할 수 있지만 전달인자 레이블을 별도로 지정해주면 **함수 외부에서 매개변수의 역할을 좀 더 명확히 할 수 있습니다** .

매개변수 이름과 전달인자 레이블을 지정하는 방법은 다음과 같습니다.

```
func 함수 이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입 ...) -> 반환 타입 {
	실행 구문
    return 반환 값
}
```

```
// from과 to라는 전달인자 레이블이 있으며
// myName과 name이라는 매개변수 이름이 있는 함수 
func greeting(from myName: String, to name: Sting) -> String {
	return "Hello \(name)! I'm \(myName)"
}

print(greeting(from: "Anna", to: "Tim")) // Hello Tim! I'm Anna
```

**함수 내부에서 전달인자 레이블을 사용할 수 없으며, 함수를 호출할 때는 매개변수 이름을 사용할 수 없습니다❗️**

다른 기존 언어처럼  전달인자 레이블을 사용하고 싶지 않다면 **와일드카드 식별자(\_)** 를 사용하면 됩니다.

다음은 와일드카드 식별자(\_)를 사용하여 전달인자 레이블을 사용하지 않는 함수를 구현한 것입니다.

```
func greeting(_ name: Sring, _ alreadyGreeted: Bool) -> String {
	if alreadyGreeted {
    	return "Hello again, " + name + "!"
    } else {
    	return "Hello, " + name + "!"
    }
 }
 
 print(greeting("Tim", true)) // Hello again, Tim!
```

여기서 전달인자 레이블을 변경하면 함수의 이름 자체가 변경됩니다. 따라서 **전달인자 레이블만 다르게 써주면 함수 중복 정의(오버로드)로 동작할 수 있습니다.**

### 매개변수 기본값

스위프트의 함수에서는 매개변수마다 기본값을 지정해줄 수 있어 **매개변수가 전달되지 않으면 기본값을 사용** 합니다.

```
// alreadyGreeted 매개변수가 기본값 false를 갖음
func greeting(_ name: Sring, _ alreadyGreeted: Bool = false) -> String {
	if alreadyGreeted {
    	return "Hello again, " + name + "!"
    } else {
    	return "Hello, " + name + "!"
    }
 }
 
 // alreadyGreeted 매개변수의 전달 값을 넘겨주지 않아 기본값 false를 반영해서 출력됨
 print(greeting("Lucy")) // Hello, Lucy!
 
 // alreadyGreeted 매개변수의 전달 값을 true로 넘겨주어서 그에 해당하는 값이 출력됨 
 print(greeting("Tim", true)) // Hello again, Tim!
```

❗️ 기본값이 없는 매개변수를 기본값이 있는 매개변수 앞에 사용하는 것이 좋습니다.

### 가변 매개변수

가변 매개변수는 **매개변수로 몇 개의 값이 들어올지 모를 때** 사용할 수 있습니다.

0개 이상(0개 포함)의 값을 받아올 수 있으며, 가변 매개변수로 들어온 인자 값은 배열처럼 사용할 수 있습니다.

단, 함수마다 가변 매개변수는 **하나만** 가질 수 있습니다.

```
func greetToFriends(me: String, friends names: String...) -> String {
	var result: String = ""
    
    for friend in names {
    	result += "Hello \(friend)!" + " "
    }
    
    result += "I'm" + me + "!"
    return result
}

print(greetToFriends(me: "Lucy", friends: "Anna", "Tim", "Jay"))
// Hello Anna! Hello Tim! Hello Jay! I'mLucy!
```