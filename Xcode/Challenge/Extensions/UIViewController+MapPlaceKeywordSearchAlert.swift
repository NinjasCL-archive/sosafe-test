//
//  Challenge
//
//  Created by Camilo Castro on 06-09-20.
//  Copyright © 2020 SoSafe. All rights reserved.
//

import UIKit

extension UIViewController {
    func showMapPlaceKeywordSearchAlert(_ okHandler: ((_ query: String) -> Void)? = nil, cancelHandler: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: "Buscar Ubicaciones por Palabras Claves", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { textfield in
            textfield.placeholder = "Quilpué"
            textfield.keyboardType = .webSearch
            textfield.keyboardAppearance = .alert
        })
        
        let okAction = UIAlertAction(title: "Buscar", style: .default) {[unowned alert] _ in
            let query = alert.textFields?[0].text ?? ""
            okHandler?(query)
        }
         
        let cancelAction = UIAlertAction(title: "Cancelar", style:.destructive) { _ in
            cancelHandler?()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
