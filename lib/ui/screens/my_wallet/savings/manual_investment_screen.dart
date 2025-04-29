import 'package:budgeit/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class ManualInvestmentScreen extends StatefulWidget {
  const ManualInvestmentScreen({super.key});

  @override
  State<ManualInvestmentScreen> createState() => _ManualInvestmentScreenState();
}

class _ManualInvestmentScreenState extends State<ManualInvestmentScreen> {
  double currentValue = 0;

  final DatabaseReference stocksRef =
  FirebaseDatabase.instance.ref().child('stocks');

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.keyboard_backspace),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.03,
                            ),
                            Material(
                              elevation: 1.0,
                              child: Text(
                                'Manual Investment',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context)
                                    .primaryColor,),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Text(
                          'Select risk capacity range',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        Center(
                          child: Text(
                            currentValue.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Slider(
                            value: currentValue,
                            min: 0,
                            max: 100,
                            activeColor: Theme.of(context).primaryColor,
                            inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                            onChanged: (value) {
                              setState(() {
                                currentValue = value;
                              });
                            }),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        Text(
                          'Stocks according to risk capacity',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.01,
                        ),
                        const Text(
                          'Click on a stock to invest',
                          style: TextStyle(color: kGrayTextC, fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Coming Soon',
                          style: TextStyle(
                              fontSize: 26,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}