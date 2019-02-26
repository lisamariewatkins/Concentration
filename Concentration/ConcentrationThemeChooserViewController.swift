//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Lisa Watkins on 2/26/19.
//  Copyright © 2019 lwatkins2. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    
//  MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle,
                let _ = Themes.emojis[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = themeName
                }
            }
        }
    }

}
