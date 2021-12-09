//
//  Budget.swift
//  BudgetTracker
//
//  Created by angel zambrano on 8/18/21.
//

import Foundation

// the model for the Budget Tracker
class Transaction {
    private var transationType: TransactionType = .none
    private var expense: String
    private var cost: Double
    private var transactionStatement: String
    static var total: Double = 0
    
    init(transactionType: TransactionType, expense:String,cost: Double) {
        self.transationType = transactionType
        self.expense = expense
        self.cost = cost
        transactionStatement = "\(expense) \(transationType.returnType())$\(String(format: "%.2f", cost))\n"
        
        if self.transationType == .adding {
            Transaction.total += cost
        }
        
        if self.transationType == .subtracting {
            Transaction.total -= cost
        }
        
        }
        
    func getTransactionType() -> TransactionType{
        return transationType
    }
  
    
    func getTransactionStatement() -> String {
        return transactionStatement
    }
    
}

enum TransactionType {
    case adding
    case subtracting
    case none
    
    func returnType() -> String {
        if self == .adding {
            return "+"
        }
        else if self == .subtracting {
            return "-"
        }
        else if self == .none {
            return "none"
        }
        return "There is an error in Transaction Type"
    }


}
