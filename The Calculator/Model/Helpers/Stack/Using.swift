import Foundation

class Stacks {
        
    var ofNumbers = Stack<Double>()
    var ofSigns = Stack<Operation>()
    
    func cleanAll() {
        ofNumbers.clean()
        ofSigns.clean()
    }
}
