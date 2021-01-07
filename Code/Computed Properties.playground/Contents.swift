struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint {    //  연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        // 설정자
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
        /*
         newValue로 매개변수 이름을 대신할 수 있습니다.
         
         set {
             x = -newValue.x
             y = -newValue.y
         }
         */
    }
}
    
var eunseoPosition: CoordinatePoint = CoordinatePoint(x: 5, y: 10)
    
// 현재 좌표
print(eunseoPosition)   // 5, 10

// 대칭 좌표
print(eunseoPosition.oppositePoint) // -5, -10

// 대칭 좌표 설정
eunseoPosition.oppositePoint = CoordinatePoint(x: 3, y: 6)

// 현재 좌표
print(eunseoPosition)   // -3, -6
