import UIKit

/*
 1. Создайте перечисление для ошибок. Добавьте в него 3 кейса:
 ошибка 400,
 ошибка 404,
 ошибка 500.
 Далее создайте переменную, которая будет хранить в себе какую-либо ошибку (400 или 404 или 500). И при помощи do-catch сделайте обработку ошибок перечисления. Для каждой ошибки должно быть выведено сообщение в консоль.
 */

enum ServerError: Error {
    case isError400
    case isError404
    case isError500
}

var isError400: Bool = false
var isError404: Bool = true
var isError500: Bool = false

do {
    if isError400 {
        throw ServerError.isError400
    }
 
    if isError404 {
        throw ServerError.isError404
    }
 
    if isError500 {
        throw ServerError.isError500
    }
} catch ServerError.isError400 {
    print("Сервер вернул ошибку 400 Bad Request")
} catch ServerError.isError404 {
    print("Сервер вернул ошибку 404 Not Found")
} catch ServerError.isError500 {
    print("Сервер вернул ошибку 500 Internal Server Error")
}

/*
 2. Теперь добавьте проверку переменных в генерирующую функцию и обрабатывайте её!
 */

func checkServerErrors() throws {
    if isError400 { throw ServerError.isError400 }
    if isError404 { throw ServerError.isError404 }
    if isError500 { throw ServerError.isError500 }
}

// меняем значения для проверки
isError404 = false
isError400 = true

do {
    try checkServerErrors()
} catch ServerError.isError400 {
    print("Сервер вернул ошибку 400 Bad Request")
} catch ServerError.isError404 {
    print("Сервер вернул ошибку 404 Not Found")
} catch ServerError.isError500 {
    print("Сервер вернул ошибку 500 Internal Server Error")
}

/*
3. Напишите функцию, которая будет принимать на вход два разных типа и проверять: если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае — “No”.
*/

func checkTypes<T, E>(a: T, b: E) {
    if type(of: a) == type(of: b) {
        print("Yes")
    } else {
        print("No")
    }
}
 
checkTypes(a: "a", b: 5)
checkTypes(a: 10, b: 5)

/*
4. Реализуйте то же самое, но если тип входных значений различается, выбросите исключение. Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые. Не бойтесь этого. Ошибки — это не всегда про плохой результат.
*/

enum CheckTypeError: Error {
    case isEqualTypes // типы совпадают
    case isDifferentTypes // типы не совпадают
}

func checkTypesWithThrow<T, E>(a: T, b: E) throws {
    if type(of: a) == type(of: b) {
        throw CheckTypeError.isEqualTypes
    } else {
        throw CheckTypeError.isDifferentTypes
    }
}

// типы отличаются
do {
 try checkTypesWithThrow(a: "a", b: 5)
} catch CheckTypeError.isEqualTypes {
    print("Типы одинаковы")
} catch CheckTypeError.isDifferentTypes {
    print("Типы отличаются")
}

// типы одинаковы

do {
 try checkTypesWithThrow(a: 10, b: 5)
} catch CheckTypeError.isEqualTypes {
    print("Типы одинаковы")
} catch CheckTypeError.isDifferentTypes {
    print("Типы отличаются")
}

/*
5. Напишите функцию, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==.
*/

func checkForEquality<T: Equatable>(a: T, b: T) {
    if a == b {
        print ("Значение равны")
    } else {
        print ("Значение отличаются")
    }
}
 
checkForEquality(a: 5, b: 5)
checkForEquality(a: 10, b: 5)
