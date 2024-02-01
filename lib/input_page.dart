import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slider/results.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

const inactiveCardColor = Color(0xFF424242);
const activeCardColor = Color(0x8A000000);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int weight = 73;
  int height = 173;
  int age = 23;

  int _currentValue = 140;
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;


  void updateColour(int gender){
    if(gender == 1){
      if(maleCardColour == inactiveCardColor){
        maleCardColour = activeCardColor;
        femaleCardColour = inactiveCardColor;
      } else {
        maleCardColour = inactiveCardColor;
      }
    }
    if(gender == 2){
      if(femaleCardColour == inactiveCardColor){
        femaleCardColour = activeCardColor;
        maleCardColour = inactiveCardColor;
      }
      else {
        femaleCardColour = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Text(
            "BMI calculator",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableContainer(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.person,
                        label: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableContainer(
                        colour: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.personDress,
                        label: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableContainer(
                  colour: Colors.grey.shade800,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: labelTextStyle),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(_currentValue.toString(), style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                        SizedBox(width: 10),
                        Text("cm", style: labelTextStyle),
                      ],
                    ),
                    SizedBox(height: 20),
                    Slider(
                      min: 120,
                      max: 220,
                        divisions: 220,
                        label: "Height $_currentValue",
                        value: _currentValue.toDouble(),
                      activeColor: Colors.lightBlueAccent,
                      inactiveColor: Colors.blue,
                      thumbColor: Colors.blue,
                      secondaryActiveColor: Colors.red,
                      secondaryTrackValue: 150,
                      onChanged: (double value){
                        setState(() {
                          _currentValue = value.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                      colour: Colors.grey.shade800,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: labelTextStyle),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConIconButton(
                              icon: Icons.add,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(width: 15),
                            ConIconButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icons.remove,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                      colour: Colors.grey.shade800,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: labelTextStyle),
                        Text(age.toString(), style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConIconButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            icon: Icons.add,
                          ),
                            SizedBox(width: 15),
                            ConIconButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.remove,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultsPage();
                }));
              },
              child: Container(
                child: Center(child: Text("Calculate", style: TextStyle(fontSize: 20),)),
                color: Colors.blueGrey,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: kBottomNavigationBarHeight,
              ),
            ),
          ],
        ),);
  }
}


class ConIconButton extends StatelessWidget {
  
  ConIconButton({required this.icon, required this.onPressed});
  
  final IconData icon;
  final void Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 60,
      ),
        onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      fillColor: Color(0x8A000000),
    );
  }
}
