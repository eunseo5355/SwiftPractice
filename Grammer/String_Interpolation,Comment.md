# 💡문자열 보간법 (String Interpolation)

변수 또는 상수 등의 값을 문자열 내에 나타내고 싶을 때 사용합니다.

문자열 내에 **\\(변수나 상수)** 의 형태로 표기하면 이를 문자열로 치환해서 넣습니다.

```
let name: String = "eunseo"
print("My name is \(name)") // My name is eunseo
```

문자열 보간법을 이용하여 원하는 문자열로 치환하려면 변수나 상수 타입을 

**CustomStringConvertible 프로토콜** 을 준수하는 description 프로퍼티로 구현해야 합니다.

```Swift
struct Point {
	let x: Int, y: Int
}

let p = Point(x: 3, y:15)
print(p) // Point(x: 3, y: 15)

extension Point: CustomStringConvertible {
	var description: String {
			return "(\(x), \(y))"
	}
}

print(p) // (3, 15)
```

---

# 💡주석

프로그램 소스 코드에 정보를 남기는 목적으로 사용합니다.

-   한 줄 주석

```Swift
// 한 줄 주석
```

-   여러 줄 주석

```Swift
/* 여러 줄 주석을 시작할 때는 슬래시와 별표를 사용한다.
이 줄도 주석으로 인식한다.
주석을 끝내고 싶을 때는 별표를 먼저 쓰면 된다.*/
```

-   중첩 주석

```Swift
/* 여러 줄 주석 안쪽에
/* 추가로 여러 줄 주석을 포함할 수 있으며
// 그 안에 한 줄 주석을 추가하여도 무방하다.
*/
이 부분도 주석처리 된다.
*/
```

-   마크업 문법을 활용한 문서화 주석  
      
    변수, 상수, 클래스, 메서드, 함수, 열거형 등을 설명하고자 하는 경우 마크업 형식에 따라 주석을 작성하면 **퀵헬프** (보기 원하는 항목 위에 마우스 커서 위치한 후 \[option\] 키를 누른 상태로 클릭)를 통해 내용을 확인할 수 있습니다.  
      
    자동으로 문서화 주석 코드를 생성하려면 문서로 만들려는 요소에 커서를 위치한 후 \[command\] + \[option\] + \[ / \] 누르면 됩니다.  
      
    마크업 형식에 따라 주석을 작성하는 방법은 [애플 공식 문서](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497-CH2-SW1)에서 볼 수 있습니다.
