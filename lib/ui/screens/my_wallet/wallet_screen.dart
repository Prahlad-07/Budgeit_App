import 'package:budgeit/constants/colors.dart';
import 'package:budgeit/ui/screens/my_wallet/expenses/expenses_screen.dart';
import 'package:budgeit/ui/screens/my_wallet/need/need_screen.dart';
import 'package:budgeit/ui/screens/my_wallet/savings/savings_screen.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      Material(
                        elevation: 2.0,
                        child: Text(
                          'My Wallet',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.005,
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: kPurpleColor,
                        controller: _tabController,
                        unselectedLabelColor: kGrayTextC,
                        indicatorColor: kPurpleColor,
                        tabs: const [
                          Tab(text: 'Need'),
                          Tab(text: 'Expenses'),
                          Tab(text: 'Savings'),
                        ],
                      ),
                      Expanded(
                        // height: constraints.maxHeight * 0.8,
                        // width: double.maxFinite,
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            NeedScreen(),
                            ExpensesScreen(),
                            SavingsScreen(),
                          ],
                        ),
                      ),
                    ],
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