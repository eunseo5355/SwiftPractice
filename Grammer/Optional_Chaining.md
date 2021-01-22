# 💡옵셔널 체이닝 (Optional Chaining)

옵셔널에 값이 있다면 프로퍼티, 메서드, 서브스크립트 등을 호출할 수 있고, 옵셔널이 nil이라면 프로퍼티, 메서드, 서브스크립트 등을 nil을 반환합니다. 즉, 옵셔널을 반복 사용하여 체인처럼 서로 꼬리를 물고 있는 모양이기 때문에 옵셔널 체이닝이라고 합니다.

**중첩된 옵셔널 중 하나라도 값이 존재하지 않는다면 결과적으로 nil을 반환** 합니다.

옵셔널 체이닝은 호출하고 싶은 옵셔널 변수나 상수 뒤에 **물음표(?)** 를 붙여 표현합니다.

다음은 사람의 주소 정보 표현을 설계한 것입니다.

이를 사용하여 옵셔널 체이닝에 대한 예시를 들어보겠습니다~!

```Swift
// 호실 정보를 나타내는 클래스
class Room {    
    var number: Int // 호실 번호
    
    init(number: Int) {
        self.number = number
    }
}

// 건물 정보를 나타내는 클래스
class Building {    
    var name: String	// 건물 이름
    var room: Room?	// 호실(옵셔널)
    
    init(name: String) {
        self.name = name
    }
}

struct Address {    // 주소
    var province: String    // 광역시/도
    var city: String    // 시/군/구
    var street: String  // 도로명
    var building: Building? // 건물(옵셔널)
    var detailAddress: String?  // 건물 외 상세 주소(옵셔널)
}

// 사람의 정보를 나타내는 클래스
class Person {  
    var name: String    // 이름
    var address: Address?   // 주소(옵셔널)
    
    init(name: String) {
        self.name = name
    }
}
```

먼저 eunseo라는 사람 인스턴스를 생성합니다.

```Swift
let eunseo: Person = Person(name: "eunseo")
```

이제 eunseo가 사는 호실 번호를 알고싶습니다.

이럴 땐 다음과 같이 **옵셔널 체이닝** 이나 **강제 추출** 을 사용하여 알 수 있습니다.

```Swift
// 호실 번호 할당을 위한 옵셔널 체이닝 사용
let eunseoRoomViaOptionalChainig: Int? = eunseo.address?.building?.room?.number // nil
// eunseo의 address 프로퍼티가 nil이므로 옵셔널 체이닝 도중 nil 반환

let eunseoRoomViaOptionalUnwraping: Int = eunseo.address!.building!.room!.number    // 오류 발생
// 강제 추출을 사용하여 호실 번호를 할당하려 했으나 nil인 address 프로퍼티에 접근하려 할 때 런타임 오류 발생
```

위와 같이 호실 번호를 할당하려고 했지만 nil이 반환되거나 오류가 발생합니다.

그 이유는 예시에도 설명되어 있지만 아직 eunseo의 address를 할당해주지 않았기 때문입니다.

옵셔널 체이닝은 왼쪽부터 순서대로 동작하는데

위의 예제에서 **eunseo의 address가 nil이기 때문에 더 이상 다음 체인의 building을 체크하지 않고 nil을 반환**합니다.

그렇다면 호실 번호를 할당해 줄 수 없을 때 문자열을 출력해줄 수 있는 방법은 없을까요? 🧐

당연히 존재합니다!✨

바로 **옵셔널 체이닝과 옵셔널 바인딩을 결합** 하여 호실 번호를 할당해주거나 그렇지 못하면 문자열을 출력해줄 수 있습니다.

```Swift
if let roomNumber: Int = eunseo.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}
// Can not find room number
```

지금까지 옵셔널 체이닝을 이용하여 값을 받아오기만 했는데 반대로 값을 할당해줄 수도 있습니다.

```Swift
eunseo.address?.building?.room?.number = 505
print(eunseo.address?.building?.room?.number)   // nil
```

이런 식으로 값을 할당해줄 수 있지만 위 코드는 값이 제대로 할당되지 않아 nil을 반환합니다.

그 이유는 eunseo의 address 프로퍼티가 없으며 building 프로퍼티도 room 프로퍼티도 없으므로 옵셔널 체이닝 동작이 도중에 중지되었기 때문입니다. 또한, number 프로퍼티는 존재조차 하지 않으므로 505가 할당되지 않아 nil이 반환됩니다.

이제 옵셔널 체이닝을 이용하여 제대로 값을 할당해볼까요?

```Swift
eunseo.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
eunseo.address?.building = Building(name: "호텔")
eunseo.address?.building?.room = Room(number: 0)
eunseo.address?.building?.room?.number = 505

print(eunseo.address?.building?.room?.number)   // Optional(505)
```

위처럼 옵셔널 체인에 존재하는 프로퍼티를 실제로 할당해준 후 옵셔널 체이닝을 통해 값이 정상적으로 반환되는 것을 확인할 수 있습니다.
