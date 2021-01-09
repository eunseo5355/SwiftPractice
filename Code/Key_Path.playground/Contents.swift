class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

let eunseo = Person(name: "eunseo")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: eunseo)
var iMac = Stuff(name: "iMac", owner: eunseo)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNamePath = \Stuff.name
let ownerKeyPath = \Stuff.owner

// \Stuff.owner.name과 같은 표현이 됩니다.
let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)

// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 가져옵니다.
print(macbook[keyPath: stuffNamePath])  // MacBook Pro
print(iMac[keyPath: stuffNamePath]) // iMac
print(iPhone[keyPath: stuffNamePath])   // iPhone

print(macbook[keyPath: ownerNameKeyPath])  // eunseo
print(iMac[keyPath: ownerNameKeyPath]) // eunseo
print(iPhone[keyPath: ownerNameKeyPath])   // hana

// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 변경합니다.
iMac[keyPath: stuffNamePath] = "iMac Pro"
iMac[keyPath: ownerKeyPath] = hana

print(iMac[keyPath: stuffNamePath]) // iMac Pro
print(iMac[keyPath: ownerNameKeyPath])  // hana

// 상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키 경로 서브스크립트로도 값을 바꿔줄 수 없습니다.
// macbook[keyPath: stuffNamePath] = "macbook pro touch bar"    // 오류 발생!
// eunseo[keyPath: \Person.name] = "bear"   // 오류 발생!
