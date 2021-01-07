## 💡열거형(Enumerations)

**연관된 항목들을 묶어서 표현** 할 수 있는 타입입니다.

프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가합니다. 그렇기 때문에 딱 정해진 값만 열거형 값에 속할 수 있습니다.

스위프트의 열거형은 **enum** 이라는 키워드로 선언할 수 있습니다.


### 열거형 선언

```Swift
enum WeekDays {
    case mon
    case tue
    case wed
    case thu
    case fri
    case sat
    case sun
}

// 위와 같은 표현
enum WeekDays {
	case mon, tue, wed, thu, fri, sat, sun
}
```

각 항목은 그 자체가 고유한 값입니다.


### 열거형 변수 생성 및 값 변경

```Swift
var today: WeekDays = WeekDays.mon

// 위 코드와 같은 표현
var today: WeekDays = .mon

// 같은 타입인 WeekDays 내부의 항목으로만 today 값을 변경해줄 수 있음
today = .fri
```


### 열거형의 원시 값 지정 및 사용

열거형의 각 항목은 자체로도 하나의 값이지만 특정 타입으로 지정된 값을 가질 수 있습니다.

사용 방법은 **열거형 이름 오른쪽에 타입을 명시** 해주면 되고, **rawValue** 라는 프로퍼티를 사용하여 원시 값을 가져올 수 있습니다.

```Swift
enum WeekDays: String {
    case mon = "월요일"
    case tue = "화요일"
    case wed = "수요일"
    case thu = "목요일"
    case fri = "금요일"
    case sat
    case sun
}

let today: WeekDays = .wed
print("오늘은 \(today.rawValue)입니다.") // 오늘은 수요일입니다.

print("\(WeekDays.sun.rawValue)day") // sunday
```

위와 같이 일부만 문자열 형식의 원시 값을 지정해준다면 지정해주지 않은 각 항목은 이름을 그대로 원시 값으로 갖게 됩니다.  


만약 정수 타입의 원시 값을 지정해 준다면 다음과 같습니다.

```Swift
enum Numbers: Int {
    case first
    case second
    case third
    case last = 5
}

print("\(Numbers.first.rawValue), \(Numbers.second.rawValue), 
\(Numbers.third.rawValue), \(Numbers.last.rawValue)") // 0, 1, 2, 5
```

이와 같이 지정해주지 않은 항목은 첫 항목을 기준으로 0부터 1씩 늘어난 값을 갖게 됩니다.

다른 예시로 first에 8을 지정해준다면 결과는 8, 9, 10, 11이 됩니다.


### 연관 값

열거형 내의 항목(case)이 자신과 연관된 값을 가질 수 있습니다.

다만, 다른 항목이 연관 값을 갖는다고 모든 항목이 연관 값을 가질 필요는 없습니다.

```Swift
// 피자 도우를 특정 메뉴로 한정 지음
enum PizzaDough {
	case original, thin
}

// 메인 요리
enum MainDish {
    case pizza(dough: String)
    case chicken(withSauce: Bool)
    case rice
}

var lunch: MainDish = MainDish.pizza(dough: PizzaDough.original) // 피자
lunch = .chicken(withSauce: true) // 양념치킨
```