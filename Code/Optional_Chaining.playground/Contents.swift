class Room {    //  호실
    var number: Int // 호실 번호
    
    init(number: Int) {
        self.number = number
    }
}

class Building {    //  건물
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {    // 주소
    var province: String    // 광역시/도
    var city: String    // 시/군/구
    var street: String  // 도로명
    var building: Building? // 건물
    var detailAddress: String?  // 건물 외 상세 주소
}

class Person {  // 사람
    var name: String    // 이름
    var address: Address?   // 주소
    
    init(name: String) {
        self.name = name
    }
}

// eunseo 인스턴스 생성
let eunseo: Person = Person(name: "eunseo")

// 호실 번호 할당을 위한 옵셔널 체이닝 사용
let eunseoRoomViaOptionalChainig: Int? = eunseo.address?.building?.room?.number // nil
// eunseo의 address 프로퍼티가 nil이므로 옵셔널 체이닝 도중 nil 반환

//let eunseoRoomViaOptionalUnwraping: Int = eunseo.address!.building!.room!.number    // 오류 발생
// 강제 추출을 사용하여 호실 번호를 할당하려 했으나 nil인 address 프로퍼티에 접근하려 할 때 런타임 오류 발생

// 옵셔널 체이닝 코드와 옵셔널 바인딩 기능 결합
if let roomNumber: Int = eunseo.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}
// Can not find room number

// 옵셔널 체이닝을 통한 값 할당
eunseo.address?.building?.room?.number = 505
// eunseo의 address 프로퍼티가 없으며 buildiong 프로퍼티도 room 프로퍼티도 없으므로 옵셔널 체이닝 동작 도중에 중지됨
// number 프로퍼티는 존재조차 하지 않으므로 따라서 505가 할당되지 않음
print(eunseo.address?.building?.room?.number)   // nil

eunseo.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
eunseo.address?.building = Building(name: "호텔")
eunseo.address?.building?.room = Room(number: 0)
eunseo.address?.building?.room?.number = 505

print(eunseo.address?.building?.room?.number)   // Optional(505)
