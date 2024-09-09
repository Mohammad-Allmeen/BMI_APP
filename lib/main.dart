import 'package:flutter/material.dart';
import 'SplashScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var weighttCont= TextEditingController();
  var feetCont = TextEditingController();
  var inchCont = TextEditingController();

  var result= "";

  var bgColor= Colors.white;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.green,

        title: Text(widget.title),
      ),
      
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),),

                  TextField(
                    controller: weighttCont,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Enter your Weight'),
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade900,
                        )
                      )
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),

                  TextField(
                    controller: feetCont,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter height in feet"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.green.shade900
                        )
                      )

                    ),
                  ),

                  SizedBox(
                    height: 21,
                  ),

                  TextField(
                    controller: inchCont,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter your height in feet"),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.green.shade800,
                        )
                      )
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(onPressed: (){
                    var wt = weighttCont.text.toString();
                    var ft = feetCont.text.toString();
                    var inch = inchCont.text.toString();

                    if(wt!="" && ft!="" && inch!="")
                      {//BMI calculation
                       var intWeight = int.parse(wt);// all the values in to integar
                       var intfeet = int.parse(ft);
                       var intInch = int.parse(inch);

                       var totalInch= (intfeet*12)+intInch;

                       var totalCm = totalInch*2.54;

                       var tmeter = totalCm/100;

                       var bmi = intWeight/(tmeter*tmeter);

                       var msg ="";
                       if (bmi>25)
                         {
                           msg= "You are OverWeight";
                           bgColor= Colors.orange.shade300;
                         }
                       else if(bmi<18)
                         {
                           msg= "You are UnderWeight";
                           bgColor= Colors.red.shade300;
                         }
                       else
                         {
                           msg = "You are Healthy";
                           bgColor= Colors.green.shade200;
                         }

                       result = "Your BMI is: ${bmi.toStringAsFixed(3)} $msg";

                       setState(() {
                       });
                      }
                      else
                        {
                         setState(() {
                           result = "Please fill all the required fields!!";
                         });
                        }

                  }, child: Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      elevation: 10,
                      shadowColor: Colors.green
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Text(result, style: TextStyle(fontSize: 25),),

                ],
              ),
            ),
          ),
        )

    );
  }
}
