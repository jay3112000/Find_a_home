import 'package:Home/screens/login_phone.dart';
import 'package:flutter/material.dart';
import 'package:Home/screens/login_phone.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
     String phonenumber,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _phonenumber='';
  
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
     if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _phonenumber.trim(),
        _isLogin,
        context,
      );
    }

    }

   
  
  @override
  Widget build(BuildContext context) {
    
    return Center(
  
      child:   Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    
            
                  TextFormField(
                    
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email-Id',
                      
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                      ),
                     onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                 SizedBox(
                   height: 10,
                 ),
                    TextFormField(
                     
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Username',
                      
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                      ),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                     SizedBox(
                   height: 10,
                 ),
                  TextFormField(
                   
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password',
                      
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                      ),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                  SizedBox(height: 12),
                  
                     if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                  
                   FlatButton(
                      onPressed: _trySubmit,
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                               Color(0xFFFF4081),
                Color(0xFFEC407A),
                Color(0xFFF06292),
                 Color(0xFFF48FB1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                          
                          child: Text(_isLogin ? 'Login' : 'Signup',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                        ),
                      ),
                     
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      FlatButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(SignupPage.routename);
                      },
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                               Color(0xFFFF4081),
                Color(0xFFEC407A),
                Color(0xFFF06292),
                 Color(0xFFF48FB1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                          child: Text('Phone',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                        ),
                      ),
                     
                    ),
                      FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
      
    
  }
}