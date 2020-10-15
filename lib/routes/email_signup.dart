import 'package:amplify/config/consts.dart';
import 'package:flutter/material.dart';
//import 'package:amplify/config/theme.dart';
import 'package:amplify/custom_widgets/custom_button.dart';
import 'package:amplify/custom_widgets/custom_text.dart';
import 'package:amplify/custom_widgets/custom_text_field.dart';
import 'package:amplify/custom_widgets/gender_selection.dart';
import 'package:amplify/custom_widgets/drop_down_list.dart';


class EmailSignup extends StatefulWidget {
  @override
  _EmailSignupState createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> with SingleTickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,
      initialIndex: 0, // optional, because default index is zero
    );
    _tabController.addListener(() {_refresh(_tabController.index);});
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Scaffold (
        appBar: PreferredSize (
          preferredSize: Size.fromHeight(50.0),
          child: AppBar (
          backgroundColor: Colors.black,
          centerTitle: false,
          titleSpacing: 0.0,
          leadingWidth: 5.0,
          //toolbarHeight: 75.0,
          //leading: Container(),
          flexibleSpace: Row (
            children: [
              SizedBox(width: 10.0,),
              Text ('  SIGN UP', style: TextStyle(color: Color(0xfff2d493))),
            ]
          ),
          bottom: TabBar (
            //indicatorColor: Color(0xfff2d493),
            indicatorColor: Colors.black,
            //indicatorWeight: 3,
            //unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            //indicatorPadding: EdgeInsets.only(left:10, top:0,),
            //labelPadding: EdgeInsets.only(bottom: 1,),
            //indicator: BoxDecoration(border: Border.all(width: 2, color:Colors.white)),
            //indicator: UnderlineTabIndicator (
            //  borderSide: BorderSide(width:3.0, color: Color(0xfff2d493)),
            //  insets: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0)
            //),
            tabs: [
              Tab (child: Container(width: _width * 0.4, decoration: BoxDecoration(border: Border(bottom:BorderSide(color: Color(0xfff2d493), width:3.0))), child: Divider(thickness: 3,),),),
              Tab (child: Container(width: _width * 0.4, decoration: BoxDecoration(border: Border(bottom:BorderSide(color: _tabController.index == 1 ? Color(0xfff2d493) : Colors.white, width:_tabController.index == 1 ? 3.0 : 1.0))), child: Divider(thickness: 3,),),),
              //Tab (child: Container(width: _width * 0.4, decoration: BoxDecoration(border: Border(bottom:BorderSide(color:Colors.white, width:1.0))),),),
              //Container (decoration: BoxDecoration(border:Border(bottom:BorderSide(color:Colors.white, width:1.0))), child: Tab (child: Container(width: _width * 0.4, child: Divider(thickness: 3,),),),),
              //Container (alignment: Alignment.topCenter, child: Tab (child: Container(width: _width * 0.4, child: Divider(thickness: 3,),),),),
              //Tab (child: Container(width: _width * 0.4, child: Divider(thickness: 3,),),),
              //Tab (child: Divider(thickness: 3,),),
            ],
            controller: _tabController,
            isScrollable: true, // default false
          ),
        ),
        ),
        body: TabBarView (
          children: [
            EmailDetails(callback: _refresh,),
            passwordDetails(),
          ],
          controller: _tabController,
        )
      )
    );
  }
  void dispose () {
    _tabController.dispose();
    super.dispose();
  }
  void _refresh(int index) {
    print ('----- new index: $index -----');
    setState ( () {
      _tabController.index = index;
    });
  }
}

class EmailDetails extends StatefulWidget {
  final IntToVoid callback;
  EmailDetails({Key key, @required this.callback}) : super(key: key);

  @override
  _EmailDetailsState createState() => _EmailDetailsState();
}
class _EmailDetailsState extends State<EmailDetails> {
  @override
  void initState () {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(regText: "Whats your email address?",
              fontColor: Colors.black,
              align: MainAxisAlignment.start
            ),
            CustomTextField(hintText: 'Email',
              borderColor: Colors.grey[700],
              assignValueCallback: (value) {
                print ('----- username: $value -----');
              },
            ),
            ConstrainedBox(constraints: BoxConstraints(minHeight: 10, maxHeight: 20)),
            CustomText(regText: "Whats your gender?",
                fontColor: Colors.black,
                align: MainAxisAlignment.start
            ),
            GenderSelection(),
            ConstrainedBox(constraints: BoxConstraints(minHeight: 10, maxHeight: 20)),
            CustomText(regText: "How much do you train?",
                fontColor: Colors.black,
                align: MainAxisAlignment.start
            ),
            DropdownList(),
            ConstrainedBox(constraints: BoxConstraints(minHeight: 10, maxHeight: 20)),
            CustomButton(text: 'NEXT',
              bgColor: Color(0xfff2d493),
              fontColor: Colors.black,
              onPressed: () {widget.callback(1);},
            ),
          ],
        ),
      ), 
    );
  }
}
Widget passwordDetails() {
  return Scaffold (
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.white,
    body: Center(
      child: Column (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ConstrainedBox(constraints: BoxConstraints(minHeight: 10, maxHeight: 20)),
          CustomText(regText: "Choose a password",
              fontColor: Colors.black,
              align: MainAxisAlignment.start
          ),
          CustomTextField(hintText: 'Password',
            borderColor: Colors.grey[700],
            assignValueCallback: (value) {
              print ('----- password: $value -----');
            },
          ),
          CustomTextField(hintText: 'Confirm password',
            borderColor: Colors.grey[700],
            assignValueCallback: (value) {},
          ),
          CustomText(regText: "X Maximum of 8 characters", fontColor: Colors.red,
            align: MainAxisAlignment.start),
          CustomText(regText: "X A capital letter", fontColor: Colors.red,
              align: MainAxisAlignment.start),
          CustomText(regText: "X A lowercase letter", fontColor: Colors.red,
              align: MainAxisAlignment.start),
          CustomText(regText: "X A number", fontColor: Colors.red,
              align: MainAxisAlignment.start),
          CustomText(regText: "X Both boxes match", fontColor: Colors.red,
              align: MainAxisAlignment.start),
          ConstrainedBox(constraints: BoxConstraints(minHeight: 10, maxHeight: 20)),
          CustomButton(text: 'CONTINUE', bgColor: Color(0xfff2d493),
            fontColor: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
