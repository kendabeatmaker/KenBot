
import UIKit
import AVFoundation

//Hide keyboard with that delegate
//testing commits on github
class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var typing: UILabel!
    @IBOutlet weak var HumanInput: UITextField!
    //var humanText = String()
    var answer = String()
    @IBOutlet weak var tableView: UITableView!
    var humanName = "Human"
    var botAnswerVariable = String()
    var chatContent = String()
    var humanInputArray = [String]()
    var botAnswerArray = [String]()
    var chatContentArray = [String]()
    var player:AVAudioPlayer = AVAudioPlayer()
    let victoryAudio = Bundle.main.path(forResource: "chatsound", ofType: "mp3")
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    @IBAction func enterPressed(_ sender: UITextField) {
        
        typing.isHidden = false
       
        chatContentArray.append(chat(humanText: HumanInput.text!)) //never used this perameter but left it in
        let sec2 = Double(arc4random_uniform(3))
        let sec = Double(arc4random_uniform(4)) + sec2
        
        
        delayWithSeconds(sec) {
           
            self.refresh()
             self.player.play()
            self.tableViewScrollToBottom(animated: true)
            
            //self.HumanInput.isSelected = true
            self.typing.isHidden = true
            
            
            
        }
        
        HumanInput.text = ""
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
        
//        IQKeyboardManager.sharedManager().enable = true
//        IQKeyboardManager.sharedManager.enableAutoToolbar = false
//        IQKeyboardManager.sharedManager.shouldShowTextFieldPlaceholder = false
//        IQKeyboardManager.sharedManager.shouldHidePreviousNext = false
        
        HumanInput.borderStyle = UITextBorderStyle.roundedRect
        HumanInput.layer.cornerRadius = 16.0
        //HumanInput.layer.borderWidth = 1.0
        
        do {
            
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: victoryAudio!) as URL)
            
        }
        catch  {
            
            
        }
        tableView.delegate = self
        tableView.dataSource = self
        HumanInput.autocorrectionType = .no //AUTO CORRECT
        //Hide keyboard
        //       self.HumanInput.delegate = self
        //super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatContentArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.text = chatContentArray[indexPath.row]
        
//        let cell1Colour = hexStringToUIColor(hex: "CDEDFD")
//        let cell2Colour = hexStringToUIColor(hex: "F8F4E3")
//
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = cell1Colour
//
//        } else {
//            cell.backgroundColor = cell2Colour
//        }
        
        
        
        if ((cell.textLabel?.text?.range(of: "🤖 Bot")) != nil){
            
            let cell1Colour = hexStringToUIColor(hex: "CDEDFD")
            cell.backgroundColor = cell1Colour
        }
        else if ((cell.textLabel?.text?.range(of: "👤")) != nil){
            let cell2Colour = hexStringToUIColor(hex: "F6F740")
            cell.backgroundColor = cell2Colour
        }
        else {
            let cell3Colour = hexStringToUIColor(hex: "D81159").withAlphaComponent(0.7)
            cell.backgroundColor = cell3Colour
        }
        
        
        return cell
        
        
        
    }
    
    
}


