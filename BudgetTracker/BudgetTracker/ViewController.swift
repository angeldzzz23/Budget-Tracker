//
//  ViewController.swift
//  BudgetTracker
//
//  Created by angel zambrano on 8/18/21.
//

import UIKit

class ViewController: UIViewController {

    let budgetImg = UIImageView()
    let bgtTrkrLbl = UILabel() // the budget tracker label
    let priceLbl = UILabel() // the price of lbl
    // the variables for the left container
    let leftContainer = UIView() // the container that will have the transaction type, profit, amount
    let transactionLbl = UILabel() // the transaction label
    let addingButton = UIButton() // states that the expense will be added
    let subButton = UIButton() // states that the expense will be subtracted
    let typeLbl = UILabel() // the profit title
    let typeTextField = UITextField() // the name of the transaction
    
    let SecondTypeLbl = UILabel() // the title of the the type
    let secondTypeTxtField = UITextField() // enterable textfield for the cost
    let addTransactionButton = UIButton() // adds the transaction that the user entered

    let righttextView = UITextView()
    var transactions  = [Transaction]() // the Budget data structure
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setUpViews()
        setUpContraints()
    }
    
    // sets up the views
    func setUpViews() {
        // sets up the budget image
        budgetImg.image = UIImage(named: "abstract-expense-tracking")
        budgetImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(budgetImg)
        // sets up the budgetTracker title label
        bgtTrkrLbl.text = "Budget Tracker"
        bgtTrkrLbl.textAlignment = .center
        bgtTrkrLbl.font = UIFont.boldSystemFont(ofSize: 32)
        bgtTrkrLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bgtTrkrLbl)
        // set up price label
        priceLbl.text = "$0.00"
        priceLbl.textAlignment = .center
        priceLbl.font = UIFont.boldSystemFont(ofSize: 24)
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLbl)
        // set up the left container
        leftContainer.backgroundColor = UIColor.init(red: 243/255, green: 246/255, blue: 230/255, alpha: 1) // sets the background color of the container
        leftContainer.layer.cornerRadius = 8 // sets the corner radius to 8
        leftContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftContainer) // adds the left container on the view
        // set the transaction label
        transactionLbl.text = "Transation" // setting the text of the label
        transactionLbl.textAlignment = .center // set the transaction alighment to center
        transactionLbl.font = UIFont.systemFont(ofSize: 12) // set the font size of label
        transactionLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(transactionLbl) // add the label to the subview
       
        // set up for the deselected Adding Radio Button
        addingButton.setTitle("+", for: .normal)
        addingButton.setTitleColor(.init(red: 56/255, green: 58/255, blue: 72/255, alpha: 1), for: .normal)
        addingButton.layer.borderWidth = 2
        addingButton.layer.cornerRadius = 8
        addingButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        addingButton.titleLabel?.textAlignment = .center
        addingButton.layer.borderColor = CGColor(red: 56/255, green: 58/255, blue: 72/255, alpha: 1)
        addingButton.isSelected = true
        addingButton.translatesAutoresizingMaskIntoConstraints = false
        
        addingButton.addTarget(self, action: #selector(addingButtonIsPressed), for: .touchUpInside)
        view.addSubview(addingButton)
        
        // set up for the deselected subtracting Radio Button
        subButton.setTitle("-", for: .normal)
        subButton.setTitleColor(.init(red: 56/255, green: 58/255, blue: 72/255, alpha: 1), for: .normal)
        subButton.layer.borderWidth = 2
        subButton.layer.cornerRadius = 8
        subButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        subButton.titleLabel?.textAlignment = .center
        subButton.layer.borderColor = CGColor(red: 56/255, green: 58/255, blue: 72/255, alpha: 1)
        subButton.addTarget(self, action: #selector(subButtonIsPressed), for: .touchUpInside)
        subButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subButton)
        
        // set the typeLbl labely
        typeLbl.text = "Profit" // setting the text
        typeLbl.textAlignment = .center // set the alignment to the center
        typeLbl.font = UIFont.systemFont(ofSize: 12) // sets the font size of the label
        typeLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(typeLbl) // adds the label to the view
        
        // set the typeTextField text field
        typeTextField.placeholder = "i.e. pay check, Venmo" // placeholder text
        typeTextField.backgroundColor = UIColor.init(red: 230/255, green: 233/255, blue: 218/255, alpha: 1)
        typeTextField.layer.cornerRadius = 8
        // create padding
        typeTextField.font = UIFont.systemFont(ofSize: 9) // set font size
        typeTextField.textAlignment = .center
        typeTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(typeTextField)
        
        // set up for the secondTypeLabel
        SecondTypeLbl.text = "Amount" // setting the text
        SecondTypeLbl.textAlignment = .center // set the alignment to the center
        SecondTypeLbl.font = UIFont.systemFont(ofSize: 12) // sets the font size of the label
        SecondTypeLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SecondTypeLbl) // adds the label to the view
        
        // set upt for the secondTypeTxtField
        secondTypeTxtField.placeholder = "i.e. 5, 3.14" // placeholder text
        secondTypeTxtField.backgroundColor = UIColor.init(red: 230/255, green: 233/255, blue: 218/255, alpha: 1)
        secondTypeTxtField.layer.cornerRadius = 8
        secondTypeTxtField.font = UIFont.systemFont(ofSize: 9) // set font size
        secondTypeTxtField.translatesAutoresizingMaskIntoConstraints = false
        secondTypeTxtField.textAlignment = .center
        view.addSubview(secondTypeTxtField)
        
        // set up for the addTransactionButton
        addTransactionButton.setTitle("ADD >", for: .normal)
        addTransactionButton.setTitleColor(.init(red: 56/255, green: 58/255, blue: 72/255, alpha: 1), for: .normal)
        addTransactionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        addTransactionButton.titleLabel?.textAlignment = .right
        addTransactionButton.addTarget(self, action: #selector(transactionButtonIsPressed), for: .touchUpInside)
        addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addTransactionButton)
        
        // set up for the rightTextView
        righttextView.textAlignment = .center
        righttextView.backgroundColor = UIColor.init(red: 243/255, green: 246/255, blue: 230/255, alpha: 1)
        righttextView.layer.cornerRadius = 8
        righttextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(righttextView)
        
        // resets the left container
        addingButton.isSelected = true
        updateRadioBtnsAndLblsUI()
        
    }
    
    // MARK: helper methods
    // transalates the transaction type to color
    func transactionTypeToColor(transanctionType: TransactionType) -> UIColor {
        switch transanctionType {
        case .adding:
            return UIColor.init(red: 64/255, green: 83/255, blue: 250/255, alpha: 1)
        case .subtracting:
            return UIColor.init(red: 224/255, green: 113/255, blue: 158/255, alpha: 1)
        default:
            print("there is an error in transactionTypeToColor method")
            exit(0)
        }
    }
    // checks if erros exists
    func errorsExists() -> Bool {
        
        
        if let textInSecondField = secondTypeTxtField.text {
            if !textInSecondField.isInt {
                return true
            }
        }
        
        if !typeTextField.hasText || !secondTypeTxtField.hasText {
            return true
        }
        return false
    }
    
    
    
    // MARK: updating methods
    
    // updates the right text view
    func updateRightTextView() {
        /* https://stackoverflow.com/questions/25207373/changing-specific-texts-color-using-nsmutableattributedstring-in-swift/53993897
        */
        
        //texts will include every single transactions
        var texts = String()

        // get every single transaction
        transactions.forEach({texts.append($0.getTransactionStatement() + "\n")})
        
        // the string that will be edited
        let mutableAttributedString = NSMutableAttributedString.init(string: texts)
        
        // you loop through each transaction
        transactions.forEach { (transaction) in
        // you find the range
            let range = (texts as NSString).range(of: transaction.getTransactionStatement())
            
        // add attribute
            mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: transactionTypeToColor(transanctionType: transaction.getTransactionType()) , range: range)
            
        // add text alignment
        // alight the text to center
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        //
        mutableAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraph, range: range)
            
        }
        
        // set the rightTextview attributed text equal to the mutableAttributedString
        righttextView.attributedText = mutableAttributedString
    }
  
    // resets the left container
    func resetLeftContainer() {
        //addingButton.isSelected = true
        //subButton.isSelected = false
        typeTextField.text = nil
        typeTextField.layer.borderWidth = 0
        typeTextField.layer.borderColor =  .none
        secondTypeTxtField.layer.borderWidth = 0
        secondTypeTxtField.layer.borderColor =  .none
        secondTypeTxtField.text = nil
        updateRadioBtnsAndLblsUI()
    }
     
    func updateUIWhenThereAreErrors() {
        // check if typeTextField is empty
        if !typeTextField.hasText {
            //  add red border color
            typeTextField.layer.borderWidth = 1
            typeTextField.layer.borderColor =  #colorLiteral(red: 1, green: 0.3470336044, blue: 0.1972989333, alpha: 1)
        
        } else {
            typeTextField.layer.borderWidth = 0
            typeTextField.layer.borderColor =  .none
        }
        
        
        if let secondTextFieldtext = secondTypeTxtField.text {
            if !secondTextFieldtext.isInt || !secondTextFieldtext.isEmpty{
                // add red border color
                secondTypeTxtField.layer.borderWidth = 1
                secondTypeTxtField.layer.borderColor =  #colorLiteral(red: 1, green: 0.3470336044, blue: 0.1972989333, alpha: 1)
            } else {
                secondTypeTxtField.layer.borderWidth = 0
                secondTypeTxtField.layer.borderColor =  .none
            }
        }
        
    }
    
     // updates the color, and text of the label
    func updateBudgetLbl() {
      
        if Transaction.total == 0 {
            // black color
            priceLbl.textColor = UIColor(red: 56/255, green: 58/255, blue: 72/255, alpha: 1)
            // update the text in the label
            priceLbl.text = String(format: "%.2f", Transaction.total)
        }
        else if Transaction.total > 0 {
            // set the tint color to blue
            priceLbl.textColor = UIColor(red: 64/255, green: 83/255, blue: 250/255, alpha: 1)
            // update the text in the label
            priceLbl.text = String(format: "%.2f", Transaction.total)
        } else if Transaction.total < 0 {
            // set the tint color to pink
            priceLbl.textColor = UIColor(red: 224/255, green: 113/255, blue: 158/255, alpha: 1)
            // update the text in the label
            priceLbl.text = String(format: "%.2f", Transaction.total)
        }
    }
    
    func updateRadioBtnsAndLblsUI() {
        
        if addingButton.isSelected == true {
            // make the addding Button look selected
            addingButton.setTitleColor(.white, for: .normal) // set the title color to white
            addingButton.backgroundColor = UIColor.init(red: 64/255, green: 83/255, blue: 250/255, alpha: 1) // set the color to blue
            addingButton.layer.borderColor = (UIColor(red: 64/255, green: 83/255, blue: 250/255, alpha: 1)).cgColor // the border color to blue
            
            // make the subButton look deselected
            subButton.setTitleColor(.init(red: 56/255, green: 58/255, blue: 72/255, alpha: 1), for: .normal) // set title color to black
            subButton.backgroundColor = .clear // set backgrund color to clear
            subButton.layer.borderColor = CGColor(red: 56/255, green: 58/255, blue: 72/255, alpha: 1) // set the border color to
            
            // update labels
            typeLbl.text = "Profit"
            SecondTypeLbl.text = "Cost"
            // update textfields
            typeTextField.placeholder = "i.e. pay check, Venmo"
            
        }
        
        if subButton.isSelected == true {
            // make the adding button look deselected
            addingButton.setTitleColor(.init(red: 56/255, green: 58/255, blue: 72/255, alpha: 1), for: .normal) // set title color to black
            addingButton.backgroundColor = .clear // set backgrund color to clear
            addingButton.layer.borderColor = CGColor(red: 56/255, green: 58/255, blue: 72/255, alpha: 1) // set the border color to
            
            // make the subButton look selected
            subButton.setTitleColor(.white, for: .normal) // set the title color to white
            subButton.backgroundColor = UIColor.init(red: 224/255, green: 113/255, blue: 158/255, alpha: 1) // set the color to pink
            subButton.layer.borderColor = (UIColor(red: 224/255, green: 113/255, blue: 158/255, alpha: 1)).cgColor // the border color to pink
            
            // update labels
            typeLbl.text = "Expense"
            SecondTypeLbl.text = "Cost"
            // update textfields

            typeTextField.placeholder = "i.e. groceries, bills"
        }
        
    }
    
    
    
    // MARK: handling buttons being pressed
  
    // handle the subtract button being pressed
    @objc func subButtonIsPressed() {
        subButton.isSelected = true
        addingButton.isSelected = false
        updateRadioBtnsAndLblsUI()
    }
    
    // handles the adding button being pressed
    @objc func addingButtonIsPressed() {
        addingButton.isSelected = true
        subButton.isSelected = false
        updateRadioBtnsAndLblsUI()
    }
    /// handles the transaction button being pressed
    @objc func transactionButtonIsPressed() {
        
        if errorsExists() {
            // update UI when there are errors
            updateUIWhenThereAreErrors()
            // update radio buttons and lbls
            updateRadioBtnsAndLblsUI()
            // exit function
            return
        } else {
            // then we can add the transaction
            // get the transaction type
            let transactionType: TransactionType = (addingButton.isSelected) ? .adding : .subtracting
            // get the typeTextField
            let typeTextFieldText = typeTextField.text! //
            // get secondTypeTxtField
            let secondTypeTextFiieldText = secondTypeTxtField.text!
            
            
            transactions.append(Transaction(transactionType: transactionType, expense: typeTextFieldText, cost: Double(secondTypeTextFiieldText)!))
            
            // update rightTextview
            updateRightTextView()
            // reset the left container
            resetLeftContainer()
            // update the budget label
            updateBudgetLbl()
            // end of method
            return
        }
    }
   
   
    // MARK: setting up contraints

    
    // sets up the constraints in the viewController
    func setUpContraints() {
        
        // set up constraints for the budgetImage
        NSLayoutConstraint.activate([ // 20 20 trailing and leading
            budgetImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            budgetImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            budgetImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            budgetImg.heightAnchor.constraint(equalToConstant: 221)
        ])
        // setting up cconstraint for the budget tracker title label
        NSLayoutConstraint.activate([
            bgtTrkrLbl.topAnchor.constraint(equalTo: budgetImg.bottomAnchor, constant: 21),
            bgtTrkrLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        // set up price label
        NSLayoutConstraint.activate([
            priceLbl.topAnchor.constraint(equalTo: bgtTrkrLbl.bottomAnchor, constant: 8),
            priceLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        // set the left container on
        NSLayoutConstraint.activate([
            leftContainer.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 21),
            leftContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftContainer.widthAnchor.constraint(equalToConstant: 152),
            leftContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -77)
        ])
        // set the constraints for the treansaction label
        NSLayoutConstraint.activate([
            transactionLbl.topAnchor.constraint(equalTo: leftContainer.topAnchor, constant: 18),
            transactionLbl.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor)
        ])
        // set constraints for the adding radioButton
        NSLayoutConstraint.activate([
            addingButton.topAnchor.constraint(equalTo: transactionLbl.bottomAnchor, constant: 8),
            addingButton.leadingAnchor.constraint(equalTo: leftContainer.leadingAnchor, constant: 18),
            addingButton.heightAnchor.constraint(equalToConstant: 44),
            addingButton.widthAnchor.constraint(equalToConstant: 44)
        ])
        // set the constraints for the subButton radio button
        NSLayoutConstraint.activate([
            subButton.topAnchor.constraint(equalTo: transactionLbl.bottomAnchor, constant: 8),
            subButton.trailingAnchor.constraint(equalTo: leftContainer.trailingAnchor, constant: -18),
            subButton.heightAnchor.constraint(equalToConstant: 44),
            subButton.widthAnchor.constraint(equalToConstant: 44)
        ])
        // set up contraints for the profit Label
        NSLayoutConstraint.activate([
            typeLbl.topAnchor.constraint(equalTo: subButton.bottomAnchor, constant: 25),
            typeLbl.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor)
        ])
        // set up constraints for the typeTextField
        NSLayoutConstraint.activate([
            typeTextField.topAnchor.constraint(equalTo: typeLbl.bottomAnchor, constant: 10),
            typeTextField.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor),
            typeTextField.leadingAnchor.constraint(equalTo: leftContainer.leadingAnchor, constant: 13),
            typeTextField.trailingAnchor.constraint(equalTo: leftContainer.trailingAnchor, constant: -13),
            typeTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
        // set up for the secondTypeLbl
        NSLayoutConstraint.activate([
            SecondTypeLbl.topAnchor.constraint(equalTo: typeTextField.bottomAnchor, constant: 25),
            SecondTypeLbl.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor)
        ])
        // set up constraints for secondTypeTxtField
        NSLayoutConstraint.activate([
            secondTypeTxtField.topAnchor.constraint(equalTo: SecondTypeLbl.bottomAnchor, constant: 10),
            secondTypeTxtField.centerXAnchor.constraint(equalTo: leftContainer.centerXAnchor),
            secondTypeTxtField.leadingAnchor.constraint(equalTo: leftContainer.leadingAnchor, constant: 13),
            secondTypeTxtField.trailingAnchor.constraint(equalTo: leftContainer.trailingAnchor, constant: -13),
            secondTypeTxtField.heightAnchor.constraint(equalToConstant: 35)
        ])
        // set up constraints for the addTransactionButton
        NSLayoutConstraint.activate([
            addTransactionButton.bottomAnchor.constraint(equalTo: leftContainer.bottomAnchor, constant: -11),
            addTransactionButton.trailingAnchor.constraint(equalTo: leftContainer.trailingAnchor, constant: -20)
        ])
        // set up constraints for righttextView
        NSLayoutConstraint.activate([
            
            righttextView.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 21),
            righttextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            righttextView.widthAnchor.constraint(equalToConstant: 174),
            righttextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }

}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
