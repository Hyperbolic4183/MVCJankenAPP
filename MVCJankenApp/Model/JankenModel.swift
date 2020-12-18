//
//  JankenModel.swift
//  MVCJankenApp
//
//  Created by 大塚周 on 2020/12/18.
//

import UIKit

class JankenModel {
    private(set) var jankenHand = "✊" {
        didSet {
            print("値が変えられたので、Keyが「janken」ValueがjankenHandという通知を送った。 from Model")
            notificationCenter.post(name: .init(rawValue: "janken"),
                                    object: nil,
                                    userInfo: ["janken":jankenHand])
        }
    }
    let jankenArray = ["✊","✌️","🖐"]
    let notificationCenter = NotificationCenter()
    
    func janken(){
        let jankenNumber = Int.random(in: 0 ... 2)
        jankenHand =  jankenArray[jankenNumber]
        print("\(jankenHand)が出力された from Model")
    }
    
}
