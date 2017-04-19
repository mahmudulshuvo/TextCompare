//
//  ViewController.swift
//  TextCompare
//
//  Created by Shuvo on 4/18/17.
//  Copyright © 2017 SHUVO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextView!
    @IBOutlet weak var secondTextField: UITextView!
    @IBOutlet weak var compareButton: UIButton!
    @IBOutlet weak var fullStackView: UIStackView!
    @IBOutlet weak var textStackView: UIStackView!
    @IBOutlet weak var firstTextStackView: UIStackView!
    @IBOutlet weak var secondTextStackView: UIStackView!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupConstraints();
    }

    func setupConstraints() {
        
        firstTextField.layer.borderWidth = 1.0;
        secondTextField.layer.borderWidth = 1.0;
        firstTextField.layer.borderColor = UIColor.red.cgColor;
        secondTextField.layer.borderColor = UIColor.red.cgColor;
        compareButton.layer.cornerRadius = 10;
        compareButton.layer.borderColor = UIColor.black.cgColor;
        
        fullStackView.translatesAutoresizingMaskIntoConstraints = false;
        fullStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true;
        fullStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        fullStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
        fullStackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7, constant: 0).isActive = true;
        
        textStackView.translatesAutoresizingMaskIntoConstraints = false;
        textStackView.topAnchor.constraint(equalTo: self.fullStackView.topAnchor, constant: 60).isActive = true;
        textStackView.leadingAnchor.constraint(equalTo: self.fullStackView.leadingAnchor, constant: 30).isActive = true;
        textStackView.trailingAnchor.constraint(equalTo: self.fullStackView.trailingAnchor, constant: -30).isActive = true;
        textStackView.heightAnchor.constraint(equalTo: self.fullStackView.heightAnchor, multiplier: 0.6, constant: 0).isActive = true;
        
        firstTextStackView.translatesAutoresizingMaskIntoConstraints = false;
        firstTextStackView.topAnchor.constraint(equalTo: self.textStackView.topAnchor, constant: 0).isActive = true;
        firstTextStackView.leadingAnchor.constraint(equalTo: self.textStackView.leadingAnchor, constant: 0).isActive = true;
        firstTextStackView.trailingAnchor.constraint(equalTo: self.textStackView.trailingAnchor, constant: 0).isActive = true;
        firstTextStackView.heightAnchor.constraint(equalTo: self.textStackView.heightAnchor, multiplier: 0.4, constant: 0).isActive = true;
        
        secondTextStackView.translatesAutoresizingMaskIntoConstraints = false;
        secondTextStackView.bottomAnchor.constraint(equalTo: self.textStackView.bottomAnchor, constant: 0).isActive = true;
        secondTextStackView.leadingAnchor.constraint(equalTo: self.textStackView.leadingAnchor, constant: 0).isActive = true;
        secondTextStackView.trailingAnchor.constraint(equalTo: self.textStackView.trailingAnchor, constant: 0).isActive = true;
        secondTextStackView.heightAnchor.constraint(equalTo: self.textStackView.heightAnchor, multiplier: 0.4, constant: 0).isActive = true;
        
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false;
    //    buttonStackView.topAnchor.constraint(equalTo: self.textStackView.bottomAnchor, constant: -30).isActive = true;
        buttonStackView.centerXAnchor.constraint(equalTo: self.fullStackView.centerXAnchor).isActive = true;
        buttonStackView.widthAnchor.constraint(equalToConstant: 70).isActive = true;
        buttonStackView.heightAnchor.constraint(equalTo: self.fullStackView.heightAnchor, multiplier: 0.1, constant: 0).isActive = true;
        
    }
    
    
    @IBAction func compareBtnAction(_ sender: Any) {
        
        print("Button Tapped");
        let firstText:String = self.firstTextField.text;
        let secondText:String = self.secondTextField.text;
        
        print("Fist : \(firstText) Second: \(secondText)");
        let firstArray = firstText.components(separatedBy: " ");
        let secondArray = secondText.components(separatedBy: " ");
        let string = secondText;
        let attributedString = NSMutableAttributedString(string: string);
        var range:NSRange = NSMakeRange(0,0);
        for index in 0..<secondArray.count {
            
            if (secondArray.count <= firstArray.count) {
                if (firstArray[index] != secondArray[index]) {
                    print("Not matched word: \(secondArray[index]) \n");
                    range = (string as NSString).range(of: secondArray[index]);
                    attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(value: 1), range: range);
                    attributedString.addAttribute(NSUnderlineColorAttributeName, value: UIColor.red, range: range);
                }
            }

            else {
                if (index >= firstArray.count) {
                    range = (string as NSString).range(of: secondArray[index]);
                    attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(value: 1), range: range);
                    attributedString.addAttribute(NSUnderlineColorAttributeName, value: UIColor.red, range: range);
                }
                    
                else {
                    if (firstArray[index] != secondArray[index]) {
                        print("Not matched word: \(secondArray[index]) \n");
                        range = (string as NSString).range(of: secondArray[index]);
                        attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(value: 1), range: range);
                        attributedString.addAttribute(NSUnderlineColorAttributeName, value: UIColor.red, range: range);
                    }
                }
            }
        }
        secondTextField.attributedText = attributedString;
        secondTextField.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular);

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

