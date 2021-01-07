## 💡옵셔널(Optional)

옵셔널은 스위프트의 특징 중 하나인 안전성을 문법으로 담보하는 기능입니다.

옵셔널을 직역하면 '선택적인'이라는 뜻을 가지고 있는데요. 즉, **값이 있을 수도, 없을 수도 있다는 것** 을 나타냅니다.


그럼 예를 하나 들어볼까요?

Int 타입의 변수에 0을 할당하고 Srtring 타입의 변수에 ""로 빈 문자열을 만들었다면 이 두 개의 변수는 모두 값이 없다는 의미일까요?

정답은 땡❗️0과 ""빈 문자열 모두 하나의 값이지, 값이 없는 것은 아닙니다. 그렇다면 값이 없을 때는 어떻게 표현해야 될까요?

바로 **nil** 로 표현하면 됩니다.

따라서 옵셔널을 읽을 때는 **'변수나 상수가 nil일 수도 있으므로 사용에 주의하라'** 는 뜻으로 받아들일 수 있습니다.


이제 옵셔널을 한번 사용해 볼까요?✨

```Swift
var name: String = "eunseo"
name = nil // 오류발생
```

위 코드는 오류가 발생합니다.  그 이유는 nil은 옵셔널로 선언된 곳에서만 사용될 수 있기 때문입니다.

```Swift
var name: String? = "eunseo"
name = nil
```

이렇게 데이터 타입 뒤에 **물음표(?)** 를 붙여 옵셔널 선언을 해주면 오류가 나지 않고 실행됩니다.

다음은 옵셔널 값을 추출하는 방법에 대해 알아보겠습니다.


### 강제 추출

옵셔널 강제 추출(Forced Unwrapping) 방식은 가장 간단하지만 **가장 위험한 방법** 입니다.


사용 방법은 옵셔널 값의 뒤에 **느낌표(!)** 를 붙여주면 값을 강제로 추출하여 반환해줍니다.


만약 강제 추출 시 옵셔널에 값이 없다면, 즉 nil이라면 런타임 오류가 발생합니다.

```Swift
var name: String? = "eunseo"

// 옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없음! 반드시 추출해서 할당해주어야 함
var myName: String = name!

name = nil
myName = name! // 런타임 오류
```

강제 추출 방식은 런타임 오류의 가능성을 항상 내포하기 때문에 사용하는 것을 지양해야 합니다.


### 옵셔널 바인딩(Optional Binding)

위의 강제 추출보다 안전한 방법인 옵셔널 바인딩은 **옵셔널에 값이 있는지 확인할 때 사용** 합니다.

만약 옵셔널에 값이 있다면 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌 형태로 사용할 수 있도록 해줍니다.

**if let** 이나 **if var** 를 사용하는데요. 옵셔널에 값이 있다면 if문을 실행하고 nil이라면 빠져나옵니다.

```Swift
var phoneNumber: String? = "010-1234-5678"

// 옵셔널 바인딩을 통한 임시 상수 할당
if let number = phoneNumber {
	print("The phone number is \"\(number)\"")
} else { // 값이 존재하지 않는다면 실행
	print("The phone number is not exist.")
}
// The phone number is "010-1234-5678"
```

쉼표(,)를 사용해 한 번에 여러 옵셔널 값을 추출할 수도 있습니다. 단, 바인딩하려는 옵셔널 중 하나라도 값이 없다면 해당 블록 내부의 명령문은 실행되지 않습니다. 

```Swift
var myName: Stirng? = "eunseo"
var phoneNumber: String? = nil

if let name = myName, let number = phoneNumber {
	print("My name is \(name) and my phone number is \"\(number)\"")
}
```

number에 바인딩이 되지 않으므로 if문이 실행되지 않습니다.

바인딩이 되도록 phoneNumber에 값을 저장해주면 아래처럼 실행이 되는 것을 알 수 있습니다.

```Swift
phoneNumber = "010-1234-5678"

if let name = myName, let number = phoneNumber {
	print("My name is \(name) and my phone number is \"\(number)\"")
}
// My name is eunseo and my phone number is "010-1234-5678"
```


### 암시적 추출 옵셔널(Implicitly Unwrapped Optional)

nil을 할당해줄 수 있는 옵셔널이 아닌 변수나 상수가 필요할 때 사용하는 것이 바로 암시적 추출 옵셔널입니다.

사용하는 방법은 타입 뒤에 물음표(?) 대신 **느낌표(!)** 를 붙여주면 됩니다.

암시적 추출 옵셔널로 지정된 타입은 일반 값처럼 사용할 수 있으나, nil도 할당해줄 수 있습니다. 그러나 nil이 할당되어 있을 때 접근을 시도하면 런타임 오류가 발생합니다.

```Swift
var name: String! = "eunseo"
print(name) // eunseo
name = nil

name.isEmpty // 오류발생
```

옵셔널을 사용할 때는 강제 추출 또는 암시적 추출 옵셔널을 사용하기보다는 옵셔널 바인딩, 후에 포스팅될 옵셔널 체이닝 등의 방법을 사용하는 것이 훨씬 안전합니다.
