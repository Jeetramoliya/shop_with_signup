import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'app_drawer.dart';
import 'cart_screen.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/sign-up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool changeButton = false;

  moveToCart(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.of(context).pushNamed(CartScreen.routeName);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Brand Shop',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'images/1.png',
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (value.isEmpty && value.length < 2) {
                          return "Username Cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your email address",
                        labelText: "Email address",
                      ),
                      validator: (value) => EmailValidator.validate(value)
                          ? null
                          : "Please enter a valid email",
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your mobile no",
                        labelText: "Mobile number",
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.length != 10) {
                          return "Enter correct mobile number !!";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      controller: _pass,
                      validator: (val) {
                        final isDigitsOnly = int.tryParse(val);
                        if (isDigitsOnly == null) {
                          return "Password should be a numeric digits!!!";
                        } else if (val.isEmpty && val.length < 8) {
                          return 'Password length should be 8 numeric digits';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Confirm password",
                        ),
                        controller: _confirmPass,
                        validator: (val) {
                          if (val.isEmpty)
                            return 'Empty';
                          if (val != _pass.text)
                            return 'Not Match';
                          return null;
                        }),
                    SizedBox(
                      height: 40.0,
                    ),
                    InkWell(
                      onTap: () => moveToCart(context),
                      child: AnimatedContainer(
                        margin: EdgeInsets.only(left: 200),
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
