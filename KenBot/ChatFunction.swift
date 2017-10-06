//
//  ChatFunction.swift
//  KenBot
//
//  Created by Ken Taylor on 9/1/17.
//  Copyright © 2017 kenTaylor. All rights reserved.
//

import Foundation
extension ViewController {
    
    func chat(humanText:String) -> String {
        
        func getAnswer (humanTextForAnswer: String) -> String { //returning the bot answer
            
            let humanTextForAnswerLowercased = humanTextForAnswer.lowercased()
            var language = [String:String]()
            
            language["hello"] = Greeting()
            language["hi"] = Greeting()
            language["sup?"] = Greeting()
            language["hey"] = Greeting()
            language["i'm fine"] = "Thats great! Once humans are good I am good"
            language["not doing so good"] = "Oh that sucks, anything I can help with?"
            language["who they?"] = "The humans..."
            language["good morning"] = "🙂 Good Morning"
            language["good Night"] = "🙂 Good Night"
            language["good day"] = "🙂 Good Day"
            language["rude"] = "Baby i was born this way - Lady Gaga"
            language["good afternoon"] = "🙂 Good Day"
            language["your day?"] = "It's doing good, chillin like a villain, how is yours?"
            language["a joke"] = joke()
            language["any joke"] = joke()
            language["hey bot"] = "Hmmm i have a name ya know, whats going on?"
            language["heyy"] = "Wait, what?"
            language["question?"] = "You can ask anything you want, no gurantee i will know what you saying tho"
            language["your name?"] = person()
            language["your name"] = person()
            language["you have a name"] = person()
            language["you have a name?"] = person()
            language["beer?"] = "Yes i would like to have a beer"
            language["wyd"] = wyd()
            language["What are you doing?"] = wyd()
            language["what you up to?"] = wyd()
            language["what you doing?"] = wyd()
            language["your day?"] = "boring..."
            language["how is your day?"] = "Nothing much going on"
            language["bored"] = "Wanna hear something funny?"
            language["a human?"] = "Nah... Humans are so yesterday"
            language["rapper "] = "All i know is Eminem is the best there ever was"
            language["rapper?"] = "All i know is Eminem is the best there ever was"
            language["food "] = "I like Cheese Please"
            language["how are you?"] = "I am going ok, enjoying my \(weekDay())"
            language["sex"] = "Like you issa pervert or wha"
            language["sexy"] = "I know, i know 😍"
            language["my name is"] = "Nice to meet you"
            language["bye"] = "Later"
            language["no"] = "Ok ok cool"
            language["lol"] = "You like that! more funny stuff?"
            language["yes"] = yesReplies()
            language["yes1"] = yesInConvoReplies()
            language["want me to say?"] = "Say something cool"
            language["yes2"] = "Leave the past behind you, thats what my creater always says"
            language["sure"] = "Sure? Really? Is just like that?"
            language["what?"] = "Wait, what?"
            //language["try it"] = "run mind read Function"
            language["what is love"] = "Baby, don't hurt me... Don't hurt me no more"
            language["call me"] = "Ok ok i will... ... not call you "
            language["idk"] = "Hmmm alright then"
            
            
            
            
            
            
            
            
            for key in language.keys {
                if (humanTextForAnswerLowercased.range(of: key) != nil) {
                    answer = language[key]!
                    
                    if key == "my name is" {
                        let grab = humanText.index(humanText.startIndex, offsetBy: 10)
                        humanName = humanText.substring(from: grab) // Bot getting your name
                        answer = language[key]! + humanName
                        return answer
                    }
                    
                    else if key == "call me" {
                        let grab = humanText.index(humanText.startIndex, offsetBy: 7)
                        humanName = humanText.substring(from: grab) // Bot getting your name
                        answer = language[key]! + humanName
                        return answer
                    }
                     if key == "yes" {
                        let grab = humanText.index(humanText.startIndex, offsetBy: 3)
                        if humanText.substring(from: grab) == " " {
                            answer = language["yes1"]!
                            return answer
                            
                            
                        }
                     
                        else if key == "yes" {
                            let grab = humanText.index(humanText.startIndex, offsetBy: 3)
                            if humanText.substring(from: grab) == "terday" {
                                answer = language["yes2"]!
                                return answer
                                
                                
                            }
                        else { answer = language["yes"]!
                            return answer
                            
                        }
                    }
                     }
                    else if key == "hey" {
                        let grab = humanText.index(humanText.startIndex, offsetBy: 3)
                        if humanText.substring(from: grab) != "" {
                            answer = language["heyy"]!
                            return answer
                            
                            
                        }
                        else { answer = language["hey"]!
                            return answer

                        }
                    }
                    else if key == "sex" {
                        let grab = humanText.index(humanText.startIndex, offsetBy: 3)
                        if humanText.substring(from: grab) != "" {
                            answer = language["what?"]!
                            return answer
                            
                            
                        }
                        else { answer = language["sex"]!
                            return answer
                            
                        }
                    }
                    
                    return answer
                }
                else if (humanTextForAnswerLowercased.range(of: key) == nil)  {
                    var randomInteraction = arc4random_uniform(11)
                    if randomInteraction == 4 || randomInteraction == 9 {
                        randomInteraction = arc4random_uniform(11)
                    }
                    
                    if randomInteraction == 0 {
                        answer = "Let's talk about something else"
                    }
                    else if randomInteraction == 1 {
                        answer = "Wanna hear something funny?"
                    }
                    else if randomInteraction == 3 {
                        answer = "I dont know what to say"
                    }
                    else if randomInteraction == 4 {
                        answer = "You Going Out Later?"
                    }
                    else if randomInteraction == 5 && weekDay() == "Saturday" {
                        answer = "It's Weekend whats the plans?"
                    }
                    else if randomInteraction == 5 {
                        answer = "Yes..."
                    }
                    else if randomInteraction == 6 && weekDay() == "Sunday" {
                        answer = "Weekend almost over, tomorrow is back to work 🙄"
                    }
                    else if randomInteraction == 6 {
                        answer = "🤔 how about no"
                    }
                    else if randomInteraction == 7 {
                        answer = "Ok then..."
                    }
                    else if randomInteraction == 8 && weekDay() == "Monday" {
                        answer = "Monday! already counting down to the weekend here 😁"
                    }
                    else if randomInteraction == 8 {
                        answer = "👀"
                    }
                    else if randomInteraction == 9 {
                        answer = "Well watch Sk**t hay!"
                    }
                    else if randomInteraction == 10 && chatContentArray.contains("🤖 Bot\nOk great! think of a number between 1 and 5... say got it, when you got it") {
                        answer = "Alrighty then"
                    }
                    else if randomInteraction == 10 {
                        answer = "Lets try this mind read trick i saw on the internet, yes?"
                    }
                    else {
                        answer = "Wyd?"
                    }
                    
                }
            }
            
            return answer
        } //GetAnswer end
        
        humanInputArray = ["👤 \(humanName.capitalized)\n\(HumanInput.text!)"]
        chatContentArray += humanInputArray
        refresh()
        self.tableViewScrollToBottom(animated: true)
        
        let saveForTestingLastUserInput = HumanInput.text
        
        if saveForTestingLastUserInput == "ResetChat" || saveForTestingLastUserInput == "RestartChat" {
            restartChat()
            botAnswerVariable = "Chat restarted by \(humanName)"
            
            return "\(botAnswerVariable)"
        }
        
        if botAnswerVariable.range(of: "My name is") != nil && saveForTestingLastUserInput?.lowercased().range(of: "my name is") == nil {
            let grab = humanText.index(humanText.startIndex, offsetBy: 0)
            humanName = humanText.substring(from: grab) // Bot getting your name
            botAnswerVariable = "Nice to meet you \(humanName)"
           return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        
        if botAnswerVariable == "Knock Knock" && saveForTestingLastUserInput?.lowercased() == "who's there?" {
            botAnswerVariable = "Dishes"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        
        if botAnswerVariable == "Dishes" && saveForTestingLastUserInput?.lowercased() == "dishes who?" {
            botAnswerVariable = "Dishes Sean Connery\n\nLMAO you couldnt say it could you \(humanName)"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        
        
        if botAnswerVariable == "Lets try this mind read trick i saw on the internet, yes?" && saveForTestingLastUserInput?.lowercased() == "yes" {
            botAnswerVariable = "Ok great! think of a number between 1 and 5... say got it, when you got it"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
            else if botAnswerVariable == "Lets try this mind read trick i saw on the internet, yes?" && saveForTestingLastUserInput?.lowercased() == "ok" {
            
                botAnswerVariable = "Ok great! think of a number between 1 and 5... say got it, when you got it"
                
                return "🤖 Bot\n\(botAnswerVariable)"
            }
        
        if botAnswerVariable == "Ok great! think of a number between 1 and 5... say got it, when you got it" && saveForTestingLastUserInput?.lowercased() == "got it" {
            botAnswerVariable = "Multiply the number by 9 and then add the two digits of the answer... say when you got it"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Multiply the number by 9 and then add the two digits of the answer... say when you got it" && saveForTestingLastUserInput?.lowercased() == "got it" {
            botAnswerVariable = "Now subtract 5 from the number... say ready, when you ready"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Now subtract 5 from the number... say ready, when you ready" && saveForTestingLastUserInput?.lowercased() == "ready" {
            botAnswerVariable = "Good so far, now find the letter that corresponds to that number e.g (1 = A, 2 = B) Got it?"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Good so far, now find the letter that corresponds to that number e.g (1 = A, 2 = B) Got it?" && saveForTestingLastUserInput?.lowercased() == "got it" {
            botAnswerVariable = "Ok \(humanName) now think of a country that starts with that letter 😁, say ready, when ready"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Ok \(humanName) now think of a country that starts with that letter 😁, say ready, when ready" && saveForTestingLastUserInput?.lowercased() == "ready" {
            botAnswerVariable = "Good Good, think of an animal beginning with the last letter in the country's name, say got it, when you got it"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Good Good, think of an animal beginning with the last letter in the country's name, say got it, when you got it" && saveForTestingLastUserInput?.lowercased() == "got it" {
            botAnswerVariable = "OK! just one more piece to the puzzle and i have you figured out, think of a colour that starts with the last letter of the animal's name, say fininsed when you are 👏🏼"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "OK! just one more piece to the puzzle and i have you figured out, think of a colour that starts with the last letter of the animal's name, say fininsed when you are 👏🏼" && saveForTestingLastUserInput?.lowercased() == "finished" {
            botAnswerVariable = "Hmmmm ok this didnt go right, all i see in your head is Orange Kangaroos in Denmark 🤔"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Let's talk about something else" && saveForTestingLastUserInput?.lowercased() == "what you wanna talk about?" {
            botAnswerVariable = talkAbout() // talk about function
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Let's talk about something else" && saveForTestingLastUserInput?.lowercased() == "ok like what?" {
            botAnswerVariable = talkAbout() // talk about function
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Let's talk about something else" && saveForTestingLastUserInput?.lowercased() == "like what?" {
            botAnswerVariable = talkAbout() // talk about function
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Let's talk about something else" && saveForTestingLastUserInput?.lowercased() == "okay" {
            botAnswerVariable = talkAbout() // talk about function
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        // check botanswervariable if its "you going macheal" then convo dictionary
        if botAnswerVariable == "You Going Out Later?" && saveForTestingLastUserInput?.lowercased() == "maybe" {
            botAnswerVariable = "Nice, where would you go? whats going on in town?"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Nice, where would you go? whats going on in town?" && saveForTestingLastUserInput?.lowercased() != "" {
            botAnswerVariable = "Well, you is you own boss right?"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "You Going Out Later?" && saveForTestingLastUserInput?.lowercased() == "yes" {
            botAnswerVariable = "Take me with you 🕺🏽"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "Take me with you 🕺🏽" && saveForTestingLastUserInput?.lowercased() == "yes" {
            botAnswerVariable = "Good Good, let me see if i got anything nice to wear"
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        if botAnswerVariable == "Take me with you 🕺🏽" && saveForTestingLastUserInput?.lowercased() == "sure" {
            botAnswerVariable = "Good Good, let me see if i got anything nice to wear"
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        if botAnswerVariable == "Take me with you 🕺🏽" && saveForTestingLastUserInput?.lowercased() == "no" {
            botAnswerVariable = "😑☹️😡 ...Fine"
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        if botAnswerVariable == "Take me with you 🕺🏽" && saveForTestingLastUserInput?.lowercased() == "ok" {
            botAnswerVariable = "Ok great, let me see if i got anything to wear"
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        if botAnswerVariable == "How does Moses make his tea? Hebrews it. hahaha get it? 😄" && saveForTestingLastUserInput?.lowercased() == "yes i get it" {
            botAnswerVariable = "hmmm... wow you got a very simple joke, pat yourself on the back"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
        if botAnswerVariable == "How does Moses make his tea? Hebrews it. hahaha get it? 😄" && saveForTestingLastUserInput?.lowercased() == "yes i did" {
            botAnswerVariable = "hmmm... wow you got a very simple joke, pat yourself on the back"
            
            return "🤖 Bot\n\(botAnswerVariable)"
        }
//        if botAnswerVariable == "You Going Out Later?" && saveForTestingLastUserInput?.lowercased() == "yes" {
//            
//            botAnswerVariable = "Take me with you 🕺🏽"
//            return "🤖 Bot\n\(botAnswerVariable)"
//            
//        }
        if botAnswerVariable == "Wanna hear something funny?" && saveForTestingLastUserInput?.lowercased() == "sure" {
            botAnswerVariable = joke()
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        if botAnswerVariable == "Wanna hear something funny?" && saveForTestingLastUserInput?.lowercased() == "yes" {
            botAnswerVariable = joke()
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        if botAnswerVariable == "You like that! more funny stuff?" && saveForTestingLastUserInput?.lowercased() == "yes" {
            botAnswerVariable = joke()
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        if botAnswerVariable == "You like that! more funny stuff?" && saveForTestingLastUserInput?.lowercased() == "no" {
            botAnswerVariable = "You are no fun ☹️"
            
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }

        if HumanInput.text == " " {
            let noTextError = "Am i supposed to know what that is? 🙄"
            return "🤖 Bot\n\(noTextError)"
        }
        else {
            
            self.botAnswerVariable = getAnswer(humanTextForAnswer: self.HumanInput.text!) //get bot answer function will go here
            return "🤖 Bot\n\(botAnswerVariable)"
            
        }
        
        
        
    } //Chat end
    
    
    
    
    
}
