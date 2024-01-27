import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';



class SplashScreenState  extends StatelessWidget{
  const SplashScreenState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body :SafeArea(
        child: Container(
          width: double.infinity,
          height:MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 80),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children:<Widget>[
                RichText(
                text: const TextSpan(
                text: 'News ',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Waves',
                      style: TextStyle(
                        color: Colors.blue, // Choose the color you want for the second word
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
                ),

                  const SizedBox(height: 30,),
                  Text("Dive into a world of news made simple",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20
                    ),),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                    image:DecorationImage(
                        image: AssetImage('assets/news.png')
                    )
                ),
              ),
              Column(
                children:<Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(
                        builder:(context) => const HomePage(),));
                    },
                    color: Colors.deepPurpleAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color:Colors.blueAccent
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text("Get Started",style: TextStyle(
                        fontWeight:FontWeight.w600,
                        fontSize: 18),),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

}

