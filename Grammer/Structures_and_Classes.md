구조체와 클래스는 프로그래머가 데이터를 용도에 맞게 묶어 표현하고자 할 때 유용합니다. 또한 프로퍼티와 메서드를 사용하여 구조화된 데이터와 기능을 가질 수 있습니다.

즉, 하나의 새로운 사용자 정의 데이터 타입을 만들어 주는 것입니다.

이러한 구조체와 클래스는 서로 비슷하거나 다음과 같은 공통점이 많습니다.

-   값을 저장하기 위해 프로퍼티를 정의할 수 있습니다.
-   기능 실행을 위해 메서드를 정의할 수 있습니다.
-   서브스크립트서브 스크립트 문법을 통해 구조체 또는 클래스가 갖는 값(프로퍼티)에 접근하도록 서브 스크립트를 정의할 수 있습니다.
-   초기화될 때의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있습니다.
-   초기 구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있습니다.
-   특정 기능을 실행하기 위해 특정 프로토콜을 준수할 수 있습니다.


그러나 둘의 차이점도 존재합니다.

-   구조체는 상속할 수 없습니다.
-   타입 캐스팅은 클래스의 인스턴스에만 허용됩니다.
-   디이니셜나이저는 클래스의 인스턴스에만 활용할 수 있습니다.
-   참조 횟수 계산은 클래스의 인스턴스에만 적용됩니다.

두 타입을 구분 짓는 가장 큰 차이점은 **구조체는 값 타입** 이고 **클래스는 참조 타입** 이라는 것입니다.

값 타입과 참조 타입에 대해 알아보기 전에 구조체와 클래스 각각 정의 방법에 대해 먼저 알아보고 둘의 차이점에 대해 더 자세히 알아봅시다~!


## 💡구조체

구조체는 **struct** 키워드로 정의합니다.

```Swift
struct 구조체 이름 {
	프로퍼티와 메서드들
}
```

다음은 구조체 정의 예시입니다.

```Swift
struct PersonInformation {
	var name: String
    var age: Int
}
```

위의 예시를 가지고 구조체 인스턴스의 생성 및 초기화하는 방법에 대해 알아보겠습니다.

```Swift
var p1: PersonInformation = PersonInformaion(name: "eunseo", age: 20)

// 변경 가능
p1.name = "Anna"
p1.age = 30

let p2: PersonInformation = PersonInformaion(name: "Dana", age: 25)

// 변경 불가능
// p2.name = "Tim"
// p2.age = 35
```

위와 같이 구조체를 상수 let으로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 없고,

변수 var로 선언하면 내부의 프로퍼티가 var로 선언된 경우에 값을 변경해줄 수 있습니다.

구조체 인스턴스를 생성하고 초기화하고자 할 때는 기본적으로 생성되는 멤버와이즈 이니셜라이저를 사용합니다.

---


## 💡클래스

클래스는 **class** 키워드를 사용하여 정의합니다.

```Swift
class 클래스 이름 {
	프로퍼티와 메서드들
}
```

상속을 받을 때는 다음과 같이 정의합니다.

```Swift
class 클래스 이름: 부모클래스 이름 {
	프로퍼티와 메서드들
}
```

다음은 클래스 정의 예시입니다.

```Swift
class Person {
	var weight: Float = 0.0
    var height: Float = 0.0
}
```

위의 예시를 가지고 클래스 인스턴스의 생성과 초기화에 대해 알아보겠습니다.

Person 클래스에서 프로퍼티의 기본값이 지정되어 있으므로 전달인자를 통하여 따로 초깃값을 전달해주지 않아도 됩니다.

```Swift
var eunseo: Person = Person()
eunseo.weight = 30.0
eunseo.height = 170.0

let dana: Person = Person()
dana.weight = 40.0
dana.height = 180.0
```

클래스는 구조체와는 다르게 인스턴스를 상수 let으로 선언해도 내부 프로퍼티 값을 변경할 수 있습니다.

클래스의 인스턴스는 참조 타입이므로 더는 참조할 필요가 없을 때 메모리에서 해제됩니다. 이 과정을 소멸이라고 하는데 소멸되기 직전 **deinit** 라는 메서드가 호출됩니다. 이 메서드는 **디이니셜라이저** 라고 부르며 클래스당 하나만 구현할 수 있고 매개변수와 반환 값을 가질 수 없습니다.

```Swift
class Person {
	var weight: Float = 0.0
    var height: Float = 0.0
    
    deinit {
    	print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}
 
var eunseo: Person? = Person()
eunseo = nil	// Person 클래스의 인스턴스가 소멸됩니다.
```


### 값 타입 vs 참조 타입

이제 값 타입과 참조 타입에 대해 알아볼까요?✨

앞서 말했듯이 구조체는 값 타입이고 클래스는 참조 타입입니다.

어떤 함수의 전달인자로 **값 타입** 의 값을 넘긴다면 전달될 값이 **복사되어 전달** 됩니다.

하지만 **참조 타입** 이 전달인자로 전달될 때는 값을 복사하지 않고 **참조(주소)가 전달** 됩니다. 함수의 전달인자로 넘길 때도 참조가 전달되며 다른 변수 또는 상수에 할당될 때도 참조가 할당됩니다.

먼저 구조체에 대한 예를 들어보겠습니다 ✏️

```Swift
struct PersonInformation {
	var name: String
    var age: Int
}

var eunseoInfo: PersonInformation = PersonInformation(name: "eunseo", age: 50)
eunseoInfo.age = 60

var friendInfo: PersonInformation = eunseoInfo

print("eunseo's age: \(eunseoInfo.age)")	// eunseo's age: 60
print("friend's age: \(friendInfo.age)")	// friend's age: 60

friendInfo.name = "dana"

print("\(eunseoInfo.name)")	// eunseo
print("\(friendInfo.name)")	// dana
```

friendInfo는 eunseoInfo의 값을 복사하여 할당받게 됩니다.

따라서 friendInfo의 이름을 바꿔줘도 eunseoInfo의 이름값에는 변동이 없습니다.

> 스위프트의 기본 데이터 타입은 모두 구조체입니다. (Bool, Int, String, Array, Dictionary 등등)  
> 전달인자를 통해 데이터를 전달하면 모두 값이 복사되어 전달될 뿐, 함수 내부에서 아무리 전달된 값을 변경해도 기존의 변수나 상수에는 전혀 영향을 미치지 못합니다.


다음은 클래스에 대한 예를 들어보겠습니다 ✏️

```Swift
class Person {
	var weight: Float = 0.0
    var height: Float = 0.0
}

var eunseo: Person = Person()
var dana: Person = eunseo

print("eunseo's weight: \(eunseo.weight)")	// eunseo's weight: 0.0
print("dana's weight: \(dana.weight)")	// dana's weight: 0.0

dana.height = 167.8
print("eunseo's height: \(eunseo.height)")	// eunseo's height: 167.8
print("dana's height: \(dana.height)")	// dana's height: 167.8

```

dana는 eunseo의 참조를 할당받게 됩니다.

따라서 dana의 height의 값을 변경하게 되면 eunseo의 height 값도 같이 변경된다는 것을 알 수 있습니다.

이처럼 구조체와 클래스는 비슷한 듯 다릅니다..!

그렇다면 구조체와 클래스는 각각 언제 사용하는 것이 좋을까요? 🤷🏻‍♀️

애플은 다음 조건 중 하나 이상에 해당한다면 구조체를 사용하는 것을 권장합니다.

-   연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
-   캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
-   구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
-   다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때

이외에는 클래스로 정의하여 사용하는 것이 적합합니다 :)
