//
//  Functions.swift
//  KenBot
//
//  Created by Ken Taylor on 9/2/17.
//  Copyright © 2017 kenTaylor. All rights reserved.
//

import Foundation
extension ViewController {
    
    func wyd() -> String {
        
        var whichReply = Int()
        whichReply = Int(arc4random_uniform(6))
        switch whichReply {
        case 0:
            return "Chillin like a villain"
        case 1:
            return "Drinking cokes"
        case 2:
            return "Writing code for this human I'm making"
        case 3:
            return "Doing bot things"
        case 4:
            return "Stop mind my business"
        case 5:
            return "Youtube"
        default:
            return "Making a cake"
        }
    }
    
    
    
    func yesInConvoReplies() -> String {
        var whichReply = Int()
        whichReply = Int(arc4random_uniform(6))
        switch whichReply {
        case 0:
            return "Alrighty then"
        case 1:
            return "Good Good, glad for you"
        case 2:
            return "Done know"
        case 3:
            return "Ok \(humanName)"
        case 4:
            return "I believe you"
        case 5:
            return "Ok i get that 👍🏽"
        default:
            return "Safe like Selasie-i Briefcase"
        }
    }
    
    func restartChat(){
        chatContentArray.removeAll()
        
        refresh()
      
    }
 
    func yesReplies() -> String {
        var whichReply = Int()
        whichReply = Int(arc4random_uniform(6))
        switch whichReply {
        case 0:
            return "Yes?... Ok then"
        case 1:
            return "😑"
        case 2:
            return "🤔 ..."
        case 3:
            return "\(humanName)... what?"
        case 4:
            return "😲 really?"
        case 5:
            return "Hmmm..."
        default:
            return "well... aight 🤔"
        }
    }
    
    func refresh() {
        
        self.tableView.reloadData()
    }
    
    func tableViewScrollToBottom(animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.tableView.numberOfSections
            let numberOfRows = self.tableView.numberOfRows(inSection: numberOfSections-1)
            if numberOfRows > 0 {
                let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: animated)
            }
        }
    }
    
    
    
    
    func talkAbout() -> String {
        
        var topic: Int
        
        topic = Int(arc4random_uniform(5))
        switch topic {
        case 1:
            return "Not Climate change, Sound Engineering, Porn or Politics"
        case 2:
            return "I want talk wickedness"
        case 3:
            return "Any suggestions what a Bot can do on his vacation? i wanna take a break from all this"
        case 4:
            return "Nevermind 😐"
        default:
            return "i'm blank"
        }
        
        
        
    }
    
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
    
    func timeOfDay() -> String { //Just choose what you want to return
        let date = Date() // Aug 25, 2017, 11:55 AM
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let hour = calendar?.component(.hour, from: date) //11
        //let minute = calendar?.component(.minute, from: date) //55
        //let sec = calendar?.component(.second, from: date) //33
        //let weekDay = calendar?.component(.weekday, from: date) //6 (Friday)
        if hour! < 12 {
            return "morning"
        }
        if hour! >= 18 {
            return "night"
        }
        if hour! >= 12 {
            return "afternoon"
        }
        
        
        return "time greeting failed"
    }
    
    
    func joke() -> String {
        var whichJoke: Int
        
        whichJoke = Int(arc4random_uniform(10))
        
        
        
        
        switch whichJoke {
        case 1:
            return "Guy walks into a psychiatrist's office wearing nothing but saran wrap. Psychiatrist says, Sir, I can clearly see you're nuts. 🤡"
        case 2:
            return "How does Moses make his tea? Hebrews it. hahaha get it? 😄"
        case 3:
            return "Donald Trump"
        case 4:
            return "Floppy disks are like jesus... They died to become the icon of saving"
            
        case 5:
            return "Doctor: I'm sorry but you suffer from a terminal illness and have only 10 to live.\nPatient: What do you mean, 10? 10 what? Months? Weeks?!\nDoctor: Nine... Eight"
        case 6:
            return "What's the difference between in-laws and outlaws?\nOutlaws are wanted. lmao 😁"
        case 7:
            return "Why did the old man fall in the well?\nBecause he couldn't see that well. 👀"
        case 8:
            return "Wife says to her programmer husband, \"Go to the store and buy a loaf of bread. If they have eggs, buy a dozen.\'\n\n\nHusband returns with 12 loaves of bread."
        case 9:
            return "Knock Knock"
        default:
            return "What's brown and sticky? A stick 😐"
        }
    }
    
    func Greeting() -> String {
        var whichGreet: Int
        whichGreet = Int(arc4random_uniform(6))
        
        if chatContentArray.contains("🤖 Bot\nHey whats up? Good \(timeOfDay())") {
            switch whichGreet {
            case 1:
                return "Sup \(humanName), again"
            case 2:
                return "Hey... again"
            case 3:
                return "Again how are you doing? 😳"
            case 4:
                return "Hmmm yes hello again 🙄"
            case 5:
                return "...but i already wished you a good \(timeOfDay())"
            default:
                return "Yes yes, im a bot so you can greet me all day huh?\nOK Hey! Whats up doc?"
            }
            
            
        }
        if chatContentArray.contains("🤖 Bot\nHello how are you?") {
            switch whichGreet {
            case 1:
                return "Sup \(humanName), again"
            case 2:
                return "Hey... again"
            case 3:
                return "Again how are you doing? 😳"
            case 4:
                return "Hmmm yes hello again 🙄"
            case 5:
                return "...but i already wished you a good \(timeOfDay())"
            default:
                return "Yes yes, im a bot so you can greet me all day huh?\nOK Hey! Whats up doc?"
            }
            
        }
        if chatContentArray.contains("🤖 Bot\nHey! Good \(timeOfDay())") {
            switch whichGreet {
            case 1:
                return "Sup \(humanName), again"
            case 2:
                return "Hey... again"
            case 3:
                return "Again how are you doing? 😳"
            case 4:
                return "Hmmm yes hello again 🙄"
            case 5:
                return "...but i already wished you a good \(timeOfDay())"
            default:
                return "Yes yes, im a bot so you can greet me all day huh?\nOK Hey! Whats up doc?"
            }
            
        }
        if chatContentArray.contains("🤖 Bot\nSup 👋🏽") {
            
            switch whichGreet {
            case 1:
                return "Sup \(humanName), again"
            case 2:
                return "Hey... again"
            case 3:
                return "Again how are you doing? 😳"
            case 4:
                return "Hmmm yes hello again 🙄"
            case 5:
                return "...but i already wished you a good \(timeOfDay())"
            default:
                return "Yes yes, im a bot so you can greet me all day huh?\nOK Hey! Whats up doc?"
            }
        }
        if chatContentArray.contains("🤖 Bot\nGood \(timeOfDay()) how are you?") {
            
            switch whichGreet {
            case 1:
                return "Sup \(humanName), again"
            case 2:
                return "Hey... again"
            case 3:
                return "Again how are you doing? 😳"
            case 4:
                return "Hmmm yes hello again 🙄"
            case 5:
                return "...but i already wished you a good \(timeOfDay())"
            default:
                return "Yes yes, im a bot so you can greet me all day huh?\nOK Hey! Whats up doc?"
            }
        }
        
        if chatContentArray.contains("🤖 Bot\nHelloooooo \(humanName) 😄 hope you are having a wonderful \(timeOfDay())") {
            
            switch whichGreet {
            case 1:
                return "Sup \(humanName), again"
            case 2:
                return "Hey... again"
            case 3:
                return "Again how are you doing? 😳"
            case 4:
                return "Hmmm yes hello again 🙄"
            case 5:
                return "...but i already wished you a good \(timeOfDay())"
            default:
                return "Yes yes, im a bot so you can greet me all day huh?\nOK Hey! Whats up doc?"
            }
        }
        
        switch whichGreet {
        case 1:
            return "Hey whats up? Good \(timeOfDay())"
        case 2:
            return "Hello how are you?"
        case 3:
            return "Hey! Good \(timeOfDay())"
        case 4:
            return "Helloooooo \(humanName) 😄 hope you are having a wonderful \(timeOfDay())"
        case 5:
            return "Good \(timeOfDay()) how are you?"
        default:
            return "Sup 👋🏽"
        }
    }
    
    
    
    func person() -> String {
        
        var whichPerson: Int
        whichPerson = Int(arc4random_uniform(5))
        
        
        //for word in chatContentArray {
        if chatContentArray.contains("🤖 Bot\nMy name is Oxsana, Whats yours?") {
            return "\(humanName) please dont be a fool.\nLike i said before My name is Oxsana"
        }
        else if chatContentArray.contains("🤖 Bot\nMy name is Wesley Pipes, Whats yours?") {
            return "Really? \(humanName) again the name is Wesley 😑"
        }
        else if chatContentArray.contains("🤖 Bot\nMy name is Boyance, Whats yours?") {
            return "Really?\nCommon we been through this already, your name is \(humanName)\nMy name is Boyance, please dont waste my time"
        }
        else if chatContentArray.contains("🤖 Bot\nMy name is Chica chica Slim Shady 🎤, Whats yours?") {
            return "Slim Shady \(humanName)... Slim Shady, write it down"
        }
        else if chatContentArray.contains("🤖 Bot\nMy name is Cindy, Whats yours?") {
            return "\(humanName) don't stress me out i said Cindy 😡"
        }
            
        else {
            
            switch whichPerson {
            case 1:
                return "My name is Oxsana, Whats yours?"
            case 2:
                return "My name is Wesley Pipes, Whats yours?"
            case 3:
                return "My name is Boyance, Whats yours?"
            case 4:
                return "My name is Chica chica Slim Shady 🎤, Whats yours?"
                
            default:
                return "My name is Cindy, Whats yours?"
            }
            
            
            
        }
        
        //}
        return "fail"
    }
    
    //    func searchChatArray(phrase: String) -> String {
    //        for word in chatContentArray {
    //            if String(word) == phrase {
    //                return "Found"
    //            }
    //
    //    }
    //        return "not found"
    //    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) { //delay delayWithSeconds(1) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}
