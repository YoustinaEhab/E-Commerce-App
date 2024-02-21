import 'package:ecommerce_app/Providers/user_provider.dart';
import 'package:ecommerce_app/Data/user.dart';
import 'package:ecommerce_app/Data/dbhelper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  UserProvider? userProvider;
  late TextEditingController usernameController;
  // = TextEditingController(text: UserProvider.currentUser.username);
  late TextEditingController emailController;
  // = TextEditingController(text: UserProvider.currentUser.email);
  late TextEditingController passwordController;
  // = TextEditingController(text: UserProvider.currentUser.password);
  bool isPasswordHidden = true;

  void editProfileInfo() async {
    if (_formKey.currentState!.validate()) {
      String username = usernameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      User updatedUser =
          User(username: username, email: email, password: password);
      int res = await DatabaseHelper.updateUserInfo(
          updatedUser, userProvider!.getId());
      if (res == 1) {
        userProvider!.setUser(userProvider!.getId(), updatedUser);
        //UserProvider.currentUser = updatedUser;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text('Your profile has been updated successfully!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
        setState(() {
          isPasswordHidden = true;
        });
        FocusScope.of(context).unfocus();
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content:
                const Text('Something went wrong! Please try again later.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userProvider == null)
    {
      userProvider = Provider.of<UserProvider>(context);
      usernameController =
        TextEditingController(text: userProvider!.getUser().username);
    emailController = TextEditingController(text: userProvider!.getUser().email);
    passwordController =
        TextEditingController(text: userProvider!.getUser().password);
    }

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty!";
                  }
                  return null;
                },
              ),
              // ProfileField(
              //   feildType: FieldType.name,
              //   labelText: "Full Name",
              //   placeholder: " ",
              //   fieldIcon: Icons.person,
              // ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  var emailRegex = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty!";
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Incorrect format!';
                  }
                  return null;
                },
              ),
              // ProfileField(
              //   feildType: FieldType.email,
              //   labelText: "E-mail",
              //   placeholder: " ",
              //   fieldIcon: Icons.email,
              // ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: isPasswordHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                    icon: isPasswordHidden
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field can't be empty!";
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters!';
                  }
                  return null;
                },
              ),
              // ProfileField(
              //   feildType: FieldType.password,
              //   labelText: "Password",
              //   placeholder: " ",
              //   fieldIcon: Icons.lock,
              // ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: editProfileInfo,
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
