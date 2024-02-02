import 'package:dealshop/theme.dart';
import 'package:flutter/material.dart';

class ShippingDetails extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<ShippingDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: black,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(
          "Shipping",
          style: TextStyle(color: black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  "Contact Information",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                RoundedInputField(
                    hinttext: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    }),
                SizedBox(height: 10),
                RoundedInputField(
                    hinttext: "Phone No",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: RoundedInputField(
                          hinttext: "First Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          }),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: RoundedInputField(
                          hinttext: "Last Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                RoundedInputField(
                    hinttext: "Street Address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your street address';
                      }
                      return null;
                    }),
                SizedBox(height: 10),
                RoundedInputField(hinttext: "Street Address 2"),
                SizedBox(height: 10),
                RoundedInputField(
                    hinttext: "City",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    }),
                SizedBox(height: 10),
                RoundedInputField(
                    hinttext: "Zip Code",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your zip code';
                      }
                      return null;
                    }),
                SizedBox(height: 10),
                RoundedInputField(
                    hinttext: "Country Selector",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your country';
                      }
                      return null;
                    }),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, handle continue button press
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hinttext;
  final String? Function(String?)? validator;

  const RoundedInputField({required this.hinttext, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: lightgrey,
        hintText: hinttext,
        hintStyle: TextStyle(color: black, fontWeight: FontWeight.w300),
        isDense: true,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: lightgrey,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: lightgrey,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: lightgrey,
            width: 0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: lightgrey,
            width: 0,
          ),
        ), //suffixIcon: suffixIcon,
      ),
    );
  }
}
