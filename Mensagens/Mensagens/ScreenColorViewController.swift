//
//  ScreenColorViewController.swift
//  Mensagens
//
//  Created by Lucas Inocencio on 21/11/17.
//  Copyright © 2017 Lucas Inocencio. All rights reserved.
//
import UIKit

class ScreenColorViewController: BaseViewController {
    
    @IBOutlet weak var viBorder: UIView!
    @IBOutlet weak var swWhiteBorder: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbMessage.text = message.text
        lbMessage.textColor = message.textColor
        lbMessage.backgroundColor = message.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ResultViewController
        vc.message = message
        vc.useWhiteBoorder = swWhiteBorder.isOn
    }
    
    @IBAction func changeBorder(_ sender: UISwitch) {
        viBorder.backgroundColor = sender.isOn ? .white : .clear
    }
    
}

extension ScreenColorViewController: ColorPickerProtocol {
    func applyColor(color: UIColor) {
        view.backgroundColor = color
        message.screenColor = color
    }
}

