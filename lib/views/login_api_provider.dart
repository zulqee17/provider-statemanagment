import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagment_series/provider/login_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  ValueNotifier<bool> toggle=ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print("build");
    final authProvider=Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider LogIn API"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: 10,),
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context,value,child){
                  return TextFormField(
                    controller: passController,
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      hintText: 'email',
                      prefixIcon: const Icon(Icons.key_outlined),
                      suffixIcon: InkWell(
                        onTap: (){
                          toggle.value=!toggle.value;
                        },
                        child: toggle.value?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                      ),
                    )

                );}),
            SizedBox(height: 20,),
            Consumer<AuthProvider>(builder: (context,value,child){
              return InkWell(
                onTap: (){
                  value.login(emailController.text.toString(), passController.text.toString());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Center(
                    child:value.wait ? CircularProgressIndicator(color: Colors.white,) : Text("Login"),
                  ),
                ),
              );
            })

          ],
        ),
      ),
    );
  }
}
