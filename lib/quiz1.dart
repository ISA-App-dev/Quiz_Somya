import 'package:flutter/material.dart';
class CoronaQuiz{
  var images = [
    "contact","cough","handwash","virus","corona"
  ];
  var questions = [
    "How is COVID-19 passed on?",
    "What are the common symptoms of COVID-19?",
    "Can wasing hands prevent you from COVID-19?",
    "Can you always tell if someone has COVID-19?",
    "Name the vaccine that is jointly developed by the German company BioTech and US pharma giant Pfizer for COVID-19",
  ];
  var choices = [
    ["Through droplets that come from your mouth and nose when you cough or breathe out","In sexual fluid,including semen, vaginal fluids or anal mucous","By drinking unclean water"],
    ["A new and continous cough","Fever and tiredness","Both"],
    ["YES- but only of you use a strong bleach","YES- normal soap and water or hand sanitizer is enough","NO- washing your hands doesn't stop COVID-19"],
    ["NO- not everyone with COVID-19 has symptoms","YES-it will be obvious,a person with COVID-19 coughs a lot","YES- you can tell just by where a person comes from, their race and ethnicity"],
    ["BNT162","PICOVACC","Both","None"],
  ];
  var correctAnswers = [
    "Through droplets that come from your mouth and nose when you cough or breathe out","Both","YES- normal soap and water or hand sanitizer is enough","NO- not everyone with COVID-19 has symptoms","BNT162"];
  
}
var finalScore=0;
var questionNumber=0;
var quiz = new CoronaQuiz();













class Quiz1 extends StatefulWidget{
  @override 
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}
class Quiz1State extends State<Quiz1> {
  @override 
  Widget build(BuildContext context){
    return new WillPopScope(
      onWillPop: ()async => false,
    child: Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(20.0)),
            new Container(
              alignment: Alignment.centerRight,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  new Text("Question ${questionNumber +1}of ${quiz.questions.length}",
                  style: new TextStyle(
                    fontSize: 22.0
                  ),),
                  new Text("Score: $finalScore",
                  style:new TextStyle(
                    fontSize: 22.0
                  ),),

                ],
                ),

            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Image.asset(
              "images/${quiz.images[questionNumber]}.jpg"

            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Text(quiz.questions[questionNumber],
            style: new TextStyle(
              fontSize: 20.0,
            ),),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                //button1
                new MaterialButton(
                  minWidth: 120.0,
                  color: Colors.green,
                  onPressed: (){
                    if(quiz.choices[questionNumber][0]== quiz.correctAnswers[questionNumber]){
                      debugPrint("Correct");
                      finalScore++;
                    }
                    else{
                      debugPrint("Wrong");
                    }
                    updateQuestion();
                  },
                  child: new Text(quiz.choices[questionNumber][0],
                  style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                  ),),
                  ),
                //button2
                new MaterialButton(
                  minWidth: 120.0,
                  color: Colors.green,
                  onPressed: (){
                    if(quiz.choices[questionNumber][1]== quiz.correctAnswers[questionNumber]){
                      debugPrint("Correct");
                      finalScore++;
                    }
                    else{
                      debugPrint("Wrong");
                    }
                    updateQuestion();
                  },
                  child: new Text(quiz.choices[questionNumber][1],
                  style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                  ),),
                  ),
                  //button3
                  new MaterialButton(
                  minWidth: 120.0,
                  color: Colors.green,
                  onPressed: (){
                    if(quiz.choices[questionNumber][2]== quiz.correctAnswers[questionNumber]){
                      debugPrint("Correct");
                      finalScore++;
                    }
                    else{
                      debugPrint("Wrong");
                    }
                    updateQuestion();
                  },
                  child: new Text(quiz.choices[questionNumber][2],
                  style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                  ),),
                  ) ,
                  //button4
                  new MaterialButton(
                  minWidth: 120.0,
                  color: Colors.green,
                  onPressed: (){
                    if(quiz.choices[questionNumber][3]== quiz.correctAnswers[questionNumber]){
                      debugPrint("Correct");
                      finalScore++;
                    }
                    else{
                      debugPrint("Wrong");
                    }
                    updateQuestion();
                  },
                  child: new Text(quiz.choices[questionNumber][3],
                  style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                  ),),
                  ) , 









              ],
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Container(
                alignment: Alignment.bottomCenter,
                child: new MaterialButton(
                  color: Colors.red,
                  minWidth: 240.0,
                  height: 40.0,
                  onPressed: resetQuiz,
                  child: new Text("Quit",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white
                  ), ),
                ),
              )
          ],
          ),
          ),
          ),
          );
  }
  void resetQuiz(){
    setState((){
      Navigator.pop(context);
      finalScore=0;
      questionNumber=0;


    });
  }
  void updateQuestion(){
    setState((){
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore)));

      }
      else{
        questionNumber++;
      }

    });
  }

}
class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key:key); 
  @override 
  Widget build(BuildContext context){
    return new WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
       body: new Container(
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             new Text("Final Score: $score",
             style:new TextStyle(
               fontSize: 25.0,
             ),),
             new Padding(padding: EdgeInsets.all(10.0)),
             new MaterialButton(
               color: Colors.red,
               onPressed:(){
                 questionNumber=0;
                 finalScore=0;
                 Navigator.pop(context);
               },
               child: new Text("Reset Quiz",
               style: new TextStyle(
                 fontSize: 20.0,
                 color: Colors.white,
               ),
               ))
           
           ]
           ),
           ),
           ),
       );

  }
  

}

