import 'package:amplify/config/consts.dart';
import 'package:flutter/material.dart';
import 'package:amplify/config/theme.dart';
import 'package:amplify/custom_widgets/custom_button.dart';
import 'package:amplify/custom_widgets/custom_text.dart';
import 'package:amplify/custom_widgets/custom_text_field.dart';
import 'package:amplify/custom_widgets/gender_selection.dart';
import 'package:amplify/custom_widgets/drop_down_list.dart';


class EmailSignup extends StatefulWidget {
  @override
  _EmailSignupState createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  int _tabIndex;
  void initState() {
    super.initState();
    _tabIndex = 0;
  }
  @override
  Widget build(BuildContext context) {
    print ('---- emailSignup got refreshed -----');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: DefaultTabController (
        initialIndex: _tabIndex,
        length: 2,
        child: Scaffold (
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
                Text ('SIGN UP', style: TextStyle(color: Color(0xfff2d493))),
              ]
            ),
            bottom: TabBar (
              indicatorColor: Color(0xfff2d493),
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.only(left:10),
              tabs: [
                Tab (child: Divider(thickness: 3,),),
                Tab (child: Divider(thickness: 3,),),
              ],
            ),
          ),
          ),
          body: TabBarView (
            children: [
              EmailDetails(callback: _refresh,),
              passwordDetails(),
            ]
          )
        ),
      )
    );
  }
  void _refresh(int index) {
    print ('----- new index: $index -----');
    setState ( () {
      _tabIndex = index;
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
  return Center (
    child: Text14('password'),
  );
}
