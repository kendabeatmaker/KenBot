
import UIKit
//Hide keyboard with that delegate
class ViewController: UIViewController, UITextFieldDelegate  {
    @IBOutlet weak var BotGreeting: UILabel!
    @IBOutlet weak var HumanInput: UITextField!
    @IBOutlet weak var BotAnswerWindow: UITextView!
    //var humanText = String()
    var answer = String()
    var humanName = "Human"
    var botAnswerVariable = String()
    var chatContent = String()
    
    func weekDay() -> String { //Just choose what you want to return
        let date = Date() // Aug 25, 2017, 11:55 AM
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
//        let hour = calendar?.component(.hour, from: date) //11
//        let minute = calendar?.component(.minute, from: date) //55
//        let sec = calendar?.component(.second, from: date) //33
        let weekDay = calendar?.component(.weekday, from: date) //6 (Friday)
        if weekDay == 1 {
            return "Sunday"
        }
        if weekDay == 2 {
            return "Monday"
        }
        if weekDay == 3 {
            return "Tuesday"
        }
        if weekDay == 4 {
            return "Wednesday"
        }
        if weekDay == 5 {
            return "Thursday"
        }
        if weekDay == 6 {
            return "Friday"
        }
        
        return "Saturday"
    }
    
    func joke() -> String {
        var whichJoke: Int
        
        whichJoke = Int(arc4random_uniform(4))
        switch whichJoke {
        case 1:
            return "Guy walks into a psychiatrist's office wearing nothing but saran wrap. Psychiatrist says, Sir, I can clearly see you're nuts. 🤡"
        case 2:
            return "How does Moses make his tea? Hebrews it. hahaha get it? 😄"
        case 3:
            return "Donald Trump"

        default:
           return "What's brown and sticky? A stick 😐"
        }
    }
    
    func Greeting() -> String {
        var whichGreet: Int
        whichGreet = Int(arc4random_uniform(4))
        switch whichGreet {
        case 1:
            return "Hey whats up?"
        case 2:
            return "Hello how are you?"
        case 3:
            return "Hey!"
            
        default:
            return "Sup 👋🏽"
        }
    }
    
    func person() -> String {
        var whichPerson: Int
        whichPerson = Int(arc4random_uniform(5))
        switch whichPerson {
        case 1:
            return "My name is Oxsana, Whats yours?"
        case 2:
            return "My name is Wesley Pipes, Whats yours?"
        case 3:
            return "My name is Boyance, Whats yours?"
        case 4:
            return "chica chica Slim Shady 🎤, Whats yours?"
            
        default:
            return "Hey my name is Cindy, Whats yours?"
        }
    }
    
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) { //delay delayWithSeconds(1) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    func chat(humanText:String) -> String {
       
        func getAnswer (humanTextForAnswer: String) -> String { //returning the bot answer
            
            let humanTextForAnswerLowercased = humanTextForAnswer.lowercased()
            var language = [String:String]()
            
            language["hello"] = Greeting()
            language["hi"] = Greeting()
            language["i'm fine"] = "Thats great! Once humans are good i am good"
            language["not doing so good"] = "Oh that sucks, anything i can help with?"
            language["who they?"] = "The humans..."
            language["sup?"] = "I'm doing good, chillin like a villain"
            language["hey bot"] = "Hmmm i have a name ya know, whats going on?"
            language["hey "] = "Hey, whats going on?"
            language["question?"] = "You can ask anything you want, no gurantee i will know what you saying tho"
            language["your name?"] = person()
            language["beer?"] = "Yes i would like to have a beer"
            language["rapper "] = "All i know is Eminem is the best there ever was"
            language["rapper?"] = "All i know is Eminem is the best there ever was"
            language["food "] = "I like Cheese Please"
            language["how are you?"] = "I am going ok, enjoying my \(weekDay())"
            language["sex "] = "Like you is a pervert or wha"
            language["my name is"] = "Nice to meet you"
            language["bye"] = "later"
            language["no"] = "Ok ok cool"
            language["lol"] = "You like that! You wanna hear another one?"
            language["yes"] = joke()
            language["sure"] = joke()


            for key in language.keys {
                                if (humanTextForAnswerLowercased.range(of: key) != nil) {
                    answer = language[key]!
                    BotGreeting.text = "yes"
                                    if key == "my name is" {
                                        let grab = humanText.index(humanText.startIndex, offsetBy: 10)
                                        humanName = humanText.substring(from: grab) // Bot getting your name
                                        answer = language[key]! + humanName
                                    }
                  
                    return answer
                                    }
                                    else if (humanTextForAnswerLowercased.range(of: key) == nil)  {
                                    let randomInteraction = arc4random_uniform(3)
                                    if randomInteraction == 0 {
                                    answer = "would you like to hear a joke?"
                                    }
                                    else if randomInteraction == 1 {
                                        answer = "Wanna hear something funny?"
                                    }
                                    else {
                                        answer = "I don't know what you are saying"
                                    }
                    BotGreeting.text = "no"
                }
            }

           return answer
        }
        BotAnswerWindow.text = BotAnswerWindow.text + "\n" + "\n" + "👤 \(humanName): \(HumanInput.text!)" //user
        
        if HumanInput.text == " " {
            let noTextError = "i'm a bot not a mind reader... yet" + "\n"
            return "🤖 Bot: \(noTextError)"
        }
        else {
            
            self.botAnswerVariable = getAnswer(humanTextForAnswer: self.HumanInput.text!) //get bot answer function will go here
            return "🤖 Bot: \(botAnswerVariable)"
            
        }
    }
    @IBAction func enterPressed(_ sender: UITextField) {

        
       chatContent = chat(humanText: HumanInput.text!)
        let sec = Double(arc4random_uniform(4))
        
        delayWithSeconds(sec) {
            self.BotAnswerWindow.text = self.BotAnswerWindow.text + "\n" + "\n" + String(describing: self.chatContent)
            
        }
        if HumanInput.text != nil {
            let range = NSMakeRange(BotAnswerWindow.text.characters.count - 1, 0) // scroll to the bottom
            BotAnswerWindow.scrollRangeToVisible(range)
            //BotAnswerWindow.scrollRangeToVisible(NSMakeRange(100000, 100000))
        }
        HumanInput.text = ""
        let range = NSMakeRange(BotAnswerWindow.text.characters.count - 1, 0) // scroll to the bottom
        BotAnswerWindow.scrollRangeToVisible(range)
                    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //Hide keyboard
//       self.HumanInput.delegate = self
        //super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
//Hide keyboard
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        HumanInput.resignFirstResponder()
//        return true
//    }

}


