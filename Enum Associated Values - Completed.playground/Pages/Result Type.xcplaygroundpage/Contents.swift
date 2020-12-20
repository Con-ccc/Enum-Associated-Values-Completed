/*:
 [< Previous](@previous)           [Home](Introduction)
 
 ## The Swift Result Type
 The swift Result type is a special case of a enum that was introduced in Swift 5.0
 */
import UIKit
code(for: "Examnple 5: Thowing Function") {
    enum DivError: Error {
        case divideBy0Error
    }
    
    func quotient(_ dividend: Double, _ divisor: Double) throws -> Double {
        if divisor == 0 {
            throw DivError.divideBy0Error
        }
        
        return dividend/divisor
    }
    
    func doLongDivision(num1: Double, num2: Double, completion: @escaping (Double) -> Void) {
        // do some other stuff that takes a long time to process
        do {
            let answer = try quotient(num1, num2)
            completion(answer)
        } catch {
            print(error)
        }
        
    }
    
    doLongDivision(num1: 15, num2: 0) { (answer) in
        print(answer)
    }
    
//    doLongDivision(num1: 15, num2: 5) { answer in
//        print(answer)
//    }

}


code(for: "Example 5a: Thowing Function with Result") {
    enum DivError: Error {
        case divideBy0Error
        
        var localizedDescription: String {
            NSLocalizedString("You can't divide by 0.", comment: "")
        }
    }
    
    func quotient(_ dividend: Double, _ divisor: Double) throws -> Double {
        if divisor == 0 {
            throw DivError.divideBy0Error
        }
        
        return dividend/divisor
    }
    
    func doLongDivision(num1: Double, num2: Double, completion: @escaping (Result<Double,DivError>) -> Void) {
        // do some other stuff that takes a long time to process
        do {
            let answer = try quotient(num1, num2)
            completion(.success(answer))
        } catch {
            completion(.failure(.divideBy0Error))
        }
    }
    
    doLongDivision(num1: 15, num2: 0) { (result) in
        switch result {
        case .success(let answer):
            print(answer)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}


/*:
 [< Previous](@previous)           [Home](Introduction) 
 */
