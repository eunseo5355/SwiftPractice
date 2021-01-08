# 💡프로퍼티 감시자 (Property Observers)

프로퍼티 감시자를 사용하면 **프로퍼티의 값이 변경될 때 원하는 동작을 수행** 할 수 있습니다.

프로퍼티의 값이 **새로 할당될 때마다 호출** 하며 변경되는 값이 **현재의 값과 같더라도 호출**합니다.

프로퍼티 감시자를 적용할 수 있는 프로퍼티는 다음과 같습니다.

-   **저장 프로퍼티**
-   **프로퍼티를 재정의해 상속받은 저장 프로퍼티 또는 연산 프로퍼티**

단, 상속받지 않은 연산 프로퍼티에는 프로퍼티 감시자를 사용할 필요가 없으며 할 수도 없습니다.

그 이유는 접근자와 설정자를 통해 프로퍼티 감시자를 구현할 수 있기 때문입니다.

프로퍼티 감시자에는 willSet, didSet 두 개의 메서드가 있는데요. 각각 설명해보도록 하겠습니다!

## willSet 메서드

프로퍼티의 값이 변경되기 직전에 호출되는 메서드입니다.

전달되는 전달인자는 프로퍼티가 **변경될 값** 이여서 매개변수 이름을 따로 지정하지 않으면 **newValue** 라는 이름으로 자동 지정됩니다.


## didSet 메서드

프로퍼티의 값이 변경된 직후에 호출하는 메서드입니다.

전달되는 전달인자는 프로퍼티가 **변경되기 전의 값**이여서 매개변수 이름을 따로 지정하지 않으면 **oldValue**라는 이름으로 자동 지정됩니다.

```Swift
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account()
// 잔액이 0원에서 1000원으로 변경될 예정입니다.
myAccount.credit = 1000
// 잔액이 0원에서 1000원으로 변경되었습니다.
```

위 예시는 저장 프로퍼티에 프로퍼티 감시자를 구현한 코드입니다.


다음은 위와 비슷하지만 상속받는 클래스를 추가하여 구현한 코드입니다.

```Swift
class Account {
    var credit: Int = 0 {   // 저장 프로퍼티
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double {   // 연산 프로퍼티
        get {
            return Double(credit)   // 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()
// 잔액이 0원에서 1000원으로 변경될 예정입니다.
myAccount.credit = 1000
// 잔액이 0원에서 1000원으로 변경되었습니다.

// 잔액이 1000.0달러에서 2.0달러로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경되었습니다.
myAccount.dollarValue = 2 // 잔액을 2.0달러로 변경 중입니다.
// 잔액이 1000.0달러에서 2000.0달러로 변경되었습니다.

```

dollarValue의 값을 변경할 때 먼저 값이 변경되기 전에 ForeignAccount 안의 willSet 메서드를 호출합니다.

print() 안에서 dollarValue의 값을 알아야 하므로 상속받은 Account 클래스 내부의 dollarValue 프로퍼티에서 get 메서드를 통해 credit 값을 Double로 바꿔준 1000.0 값을 반환 후에 '잔액이 1000.0달러에서 2.0달러로 변경될 예정입니다.'가 출력되고 이제 dollarValue 값을 2로 변경해주기 위해 다시 Account 클래스 내부의 dollarValue 프로퍼티에서 set 메소드를 호출합니다.

그 안에서도 credit 값을 변경해줘야하기 때문에 변경하기 전에 '잔액이 1000원에서 2000원으로 변경될 예정입니다.'가 출력되고 변경된 후에는 '잔액이 1000원에서 2000원으로 변경되었습니다.'가 출력됩니다. 그리고 '잔액을 2.0달러로 변경 중입니다.'가 출력이 되고 마지막으로 dollarValue 값이 변경된 후에 '잔액이 1000.0달러에서 2000.0달러로 변경되었습니다.'가 출력됩니다.


이러한 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등의 **외부에 위치한 지역/전역 변수에도 모두 사용 가능** 합니다.

```Swift
var a: Int = 100 {
    willSet {
        print("\(a)에서 \(newValue)로 변경될 예정입니다")
    }
    
    didSet {
        print("\(oldValue)에서 \(a)로 변경되었습니다")
    }
}

//100에서 200로 변경될 예정입니다
a = 200
// 100에서 200로 변경되었습니다
```
