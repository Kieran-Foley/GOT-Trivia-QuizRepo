/***************************************************************************************
* GOTQuiz.xcodeproj:
*
* First written on 25/07/2017
* Last modified on 26/07/2017
*
* Author: Kieran Foley
*
* Program Name: Game Of Thrones Quiz
*
* Program Description:
*  This application asks the user questions based on Game of Thrones. There is 4 possible
*  answers displayed for every question, of which one is correct. For each time the user
*  answers correctly, the total score is increased by one which is then presented to the
*  user once all questions have been asked on a seperate view (scoreViewController.swift).
***************************************************************************************/
import UIKit

// Global variable for score :(
var score = 0;

class quizViewController: UIViewController {
/***************************************************************************************
*  Variable Declarations and Outlets.
***************************************************************************************/
    
    // Array for all questions.
    var questions = ["Where do the Lannisters call home?", "What relation does Daenerys have to Jon Snow?", "What is the name of Arya Starks direwolf?", "Who does Oberyn Martell accuse The Mountain of killing?"]
    
    var answers = [["Casterly Rock", "Iron Islands", "Dorne", "Bear Island"], ["Auntie", "Sister", "Mother", "Cousin"], ["Nymeria", "Lady", "Ghost", "Sansa"], ["Elia Martell", "Lyanna Stark", "Ellaria Sand", "Tyrene Sand"]]
    
    // Acts as a counter to move to the next questions and to find the end of the array.
    var currentQuestion = 0;
    // Random no. (1-4) to change around where the right answer is located.
    var rightAnswerPlacement:UInt32 = 0;

    @IBOutlet var questionLabel: UILabel!
    
    
/*****************************************************************************************
*
* Function name : answerButtons()
*    returns : N/A
*    arg1 : button sender
* Created by : Kieran Foley
* Date created : 25/07/2017
* Date last modified : 25/07/17
* Description :
* This function connects all buttons and works out if the user has clicked on the correct
* answer or not, if so, increasing the score variable by 1. It uses unique tags placed on
* each button. It also checks to see if the user has reached the max amount of questions
* (equal to the question array) and then moves to the score view controller.
*****************************************************************************************/
    
    
    
    @IBAction func answerButtons(_ sender: UIButton) {
        
        // If the tag of the button the user clicks on equals the right answer placement.
        // Right Answer.
        if (sender.tag == Int(rightAnswerPlacement)) {
            print("right")
            score += 1;
            // Wrong answer.
        }else {
            print("Wrong")
        }
        // Testing if the current question is not equal to the length of array. (Don't call on something that doesnt exist).
        if (currentQuestion != questions.count) {
            newQuestion()
        }
            //To go onto a new view controller to show score.
        else {
            performSegue(withIdentifier: "scoreView", sender: self)
            print(score)
        }
    }
    
    
    func newQuestion() {
        // Display questions.
        questionLabel.text = questions[currentQuestion]
        
        // Assigned a random no. to the variable (1-4)
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        // Create a button
        var button:UIButton = UIButton()
        // X is used as a counter to loop through all the answers for each question.
        var x = 1;
        // The loop to assign every answer for each question to a button.
        for i in 1...4 {
            // Create a button.
            button = view.viewWithTag(i) as! UIButton
            
            button.layer.cornerRadius = 5;
            button.backgroundColor = UIColor.clear;
            button.layer.borderWidth = 4;
            button.layer.borderColor = UIColor.lightGray.cgColor;
            button.setTitleColor(UIColor.white, for: .normal)
            
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x+=1;
            }
        }
        // Moves to the next question.
        currentQuestion += 1;
    }
    
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/***************************************************************************************
* To Do List
*
*    * Add more questions and answers.
*    * Make the questions random, make many so its different every time you try.
*    * Highscores? Would need to implement users.
*    * Pictures for each question.
*    * Triva or quiz button at the start of the app?
***************************************************************************************/

}
