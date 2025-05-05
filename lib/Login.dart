import 'package:dar_water_derivery_system/Create_account.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState(); 
}
class LoginState extends State<Login> {

  


  Widget buildUsername() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('enter your username',
      style: TextStyle(
        color:Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color:Colors.white,
        borderRadius:BorderRadius.circular(10),
       boxShadow:  [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2), 

          ), 
          ],),
          height: 60,
  child: TextFormField(
    keyboardType: TextInputType.text,
    style: TextStyle(
      color: Colors.black87,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(top:14),
      prefixIcon: Icon(
        Icons.person,
        color:Color(0xff5ac18e),
      ),
      hintText: 'enter your username',
      hintStyle: TextStyle(color:Colors.black38),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a username';
      } else if (value.length < 4) {
        return 'Username must be at least 4 characters';
      } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
        return 'Only letters, numbers, and underscores are allowed';
      }
      return null;
    },
  ),
          ),

    ]
  );
}


  Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('enter your Email',
      style: TextStyle(
        color:Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color:Colors.white,
        borderRadius:BorderRadius.circular(10),
       boxShadow:  [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2), 

          ), 
          ],),
          height: 60,
  child: TextFormField(
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(
      color: Colors.black87,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(top:14),
      prefixIcon: Icon(
        Icons.person,
        color:Color(0xff5ac18e),
      ),
      hintText: 'enter your email',
      hintStyle: TextStyle(color:Colors.black38),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      } else if (!EmailValidator.validate(value)) {
        return 'Please enter a valid email';
      }
      return null;
    },
  ),
          ),

    ]
  );
}




Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('password',
      style: TextStyle(
        color:Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color:Colors.white,
        borderRadius:BorderRadius.circular(10),
       boxShadow:  [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2), 

          ), 
          ],),
          height: 60,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.lock,
                color:Color(0xff5ac18e),
              ),
              hintText: 'password',
              hintStyle: TextStyle(color:Colors.black38),
            ),
    
          validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    // Regular expression for password validation
    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$'
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters,\ninclude uppercase, lowercase, number, and special character.';
    }
    return null;
  }, ),
          ),

    ]
  );

}Widget buildConfirmPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('confirm password',
      style: TextStyle(
        color:Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color:Colors.white,
        borderRadius:BorderRadius.circular(10),
       boxShadow:  [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2), 

          ), 
          ],),
          height: 60,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.lock,
                color:Color(0xff5ac18e),
              ),
              hintText: ' confirm password',
              hintStyle: TextStyle(color:Colors.black38),
            ),
            validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    // Regular expression for password validation
    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$'
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters,\ninclude uppercase, lowercase, number, and special character.';
    }
    return null;
  },  ),
          ),

    ]
  );
}





Widget buildPhonenumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('phone number',
      style: TextStyle(
        color:Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color:Colors.white,
        borderRadius:BorderRadius.circular(10),
       boxShadow:  [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2), 

          ), 
          ],),
          height: 60,
  child: TextFormField(
    keyboardType: TextInputType.phone,
    style: TextStyle(
      color: Colors.black87,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(top:14),
      prefixIcon: Icon(
        Icons.phone,
        color:Color(0xff5ac18e),
      ),
      hintText: 'enter your phone number',
      hintStyle: TextStyle(color:Colors.black38),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your phone number';
      }
      final RegExp phoneRegex = RegExp(r'^0\d{9}$');
      if (!phoneRegex.hasMatch(value)) {
        return 'Enter a valid 10-digit Tanzanian phone number';
      }
      return null;
    },
  ),
          ),

    ]
  );
}




      
Widget buildLoginBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => print('login button pressed'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 6, 59, 33),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
Widget buildsignUpBtn(){
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () => 
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateAccount()),
      ),
      child: Text(
        'login',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            // Add tap handling if needed
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 50),
                      buildUsername(),
                       SizedBox(height: 50),
                       buildPassword(),
                        SizedBox(height: 50),
                         buildConfirmPassword(),
                          SizedBox(height: 50),
                       buildPhonenumber(),
                       SizedBox(height: 50),
                       buildLoginBtn(),
                       SizedBox(height: 20),
                        buildsignUpBtn(),
                    ],
                  ),
                ),
              ),
              // Add your form widgets here
            ],
          ),
        ),
      ),
    );
  }
}
