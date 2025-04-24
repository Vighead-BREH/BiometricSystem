import "package:flutter/material.dart";

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 180,
    height: 180,
    // color: Colors.white,
  );
}

TextField reusableTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller, {
  bool isPasswordVisible = false,
  VoidCallback? togglePasswordVisibility,
}) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType ? !isPasswordVisible : false,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withAlpha(230), // 230 = ~90% opacity
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(icon, color: Colors.white70),
      suffixIcon: isPasswordType
          ? IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: togglePasswordVisibility,
            )
          : null,
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white.withAlpha(230),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withAlpha(77),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Widget loginButton(BuildContext context, VoidCallback onTap) {
  return Container(
    width: MediaQuery.of(context).size.width, // 80% of screen width
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30), // Smooth rounded corners
      color: Colors.white, // Button background color
    ),
    clipBehavior: Clip.antiAlias, // Ensures corners are properly clipped
    child: ElevatedButton(
      onPressed: onTap, // Calls function when tapped
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Button rounding
        ),
      ),
      child: const Text(
        "Login", // Fixed text for login
        style: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
