# login_stateful

create a login stateful application to practice form, mixin and validations 

***
Build widget
```dart
 Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(
              margin: const EdgeInsets.only(top: 25.0),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }
```
***
Email field widget
```dart
Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: emailValidator,
      onSaved: (String? value) {
        email = value!;
      },
    );
  }
```
***
Password field widget
```dart
Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.password),
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: passwordValidation,
      onSaved: (String? value) {
        password = value!;
      },
    );
  }
```
***
Submit button widget
```dart
  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black45,
        backgroundColor: Colors.lightBlue,
        padding: const EdgeInsets.all(10.0),
      ),
      child: const Text('Submit!'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          if (kDebugMode) {
            print('Time to post $email and $password to my API!');
          }
        }
      },
    );
  }
```

***
Validation Mixin class
```dart
class ValidationMixin {
  String? emailValidator(String? value) {
    if (!value!.contains('@')) {
      return 'Please Enter a valid email';
    }
    return null;

  }

  String? passwordValidation(value) {
    if (value!.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
```
![img_1.png](img_1.png)

![img.png](img.png)