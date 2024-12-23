import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/Login/components/login_form.dart';
//import 'package:mate7tarsh/Screens/Signup/components/sign_up_top_image.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 8),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Username",
                  hintStyle: TextStyle(color: Color(0xFF25507a)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 20,
                  horizontal: 16 ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person_2_outlined),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 8),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Color(0xFF25507a)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 20,
                horizontal: 16 ) ,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Align(alignment: Alignment.centerRight,
          child: Padding(
            padding: const
            EdgeInsets.only(right: 16, top: 8 ),
            child:
            GestureDetector(
              onTap: () { //to add forget password screen here (navigate to a forget password screen)
              },
              child: Text("Forgot Password?"),
            ),
          ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF123F68),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),// Optional rounded corners
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            ),
            onPressed: () {},
            child: Text(
              "Login".toUpperCase(),
              style: TextStyle(color: Colors.white), // Button text color
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

