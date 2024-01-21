
import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var wheatherimg: UIImageView!
    @IBOutlet var maxTaLabel: UILabel!
    @IBOutlet var minTaLabel: UILabel!
    
    var minTaLabelText : String = ""
    var maxTaLabelText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("======= view Did Load =======")
        setView() 
    }
    
    func setView() {
        minTaLabel.text = minTaLabelText
        maxTaLabel.text = maxTaLabelText
    }
}


