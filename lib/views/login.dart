import 'package:flutter/material.dart';
import 'package:provider_statemanagment_series/provider/logedin_provider.dart';
import 'package:provider/provider.dart';

class LogInApiScreen extends StatefulWidget {
  const LogInApiScreen({super.key});

  @override
  State<LogInApiScreen> createState() => _LogInApiScreenState();
}

class _LogInApiScreenState extends State<LogInApiScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  ValueNotifier<bool> toggle=ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIn Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
             const SizedBox(height: 10,),
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context,value,child){
                  return TextFormField(
                  controller: passController,
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: const Icon(Icons.key_outlined),
                  suffixIcon: InkWell(
                  onTap: (){
                  toggle.value=!toggle.value;
                  },
                  child: toggle.value?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                  ),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      ),
      ),
      );
      }),
            const SizedBox(height: 20,),
            Consumer<AuthProviders>(builder: (context,value,child){
              return InkWell(
                onTap: (){
                  value.LogIn(emailController.text.toString(), passController.text.toString());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple,
                  ),
                  child: Center(
                    child: value.wait?CircularProgressIndicator(color: Colors.white,):Text("LogIn"),),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
