//
//  JankenViewController.swift
//  MVCJankenApp
//
//  Created by 大塚周 on 2020/12/18.
//

import UIKit

class JankenViewController: UIViewController {

    //ビューの設定
    private(set) lazy var jankenView: JankenView = JankenView()
    
    //モデルの設定
    var jankenModel: JankenModel? {
        didSet {
            print("jankenModelの値が変わり、regesterModelが実行された")
            registerModel()
        }
    }
    
    deinit {
        jankenModel?.notificationCenter.removeObserver(self)
    }
    
    override func loadView() {
        view = jankenView
    }
    override func viewDidLoad() {
        print("viewDidLoadした")
        view.backgroundColor = .white
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func registerModel() {
        print("registerModelを実行 fromController")
        guard let model = jankenModel else { return }
        jankenView.jankenLabel.text = model.jankenHand
        print("ViewのUILabelにModelのString型の変数を代入した from COntroller")
        jankenView.jankenButton.addTarget(self, action: #selector(janken), for: .touchDown)
        model.notificationCenter.addObserver(forName: .init(rawValue: "janken"),
                                             object: nil,
                                             queue: nil,
                                             using: { [unowned self] notification in
                                                if let jankenHand = notification.userInfo?["janken"] as? String {
                                                    self.jankenView.jankenLabel.text = jankenHand
                                                }
            
        })
        print("「janken」というKeyを受け取った時にそのValueをViewのjankenLabelに代入するようにした from Controller")
    }
    
    @objc func janken() {
        print("ボタンが押されたのでインスタンス化したjankenModelクラスのjanken()を実行するfrom Controller")
        jankenModel?.janken()
    }
}
