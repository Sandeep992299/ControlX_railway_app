import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLoginMode = true;
  String phoneNumber = '';
  bool rememberMe = false;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onSendOTP() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('OTP Sent!')));
  }

  @override
  Widget build(BuildContext context) {
    const blueColor = Color(0xFF0A6FFF);

    return Scaffold(
      backgroundColor: Colors.white,
      // Remove default appbar height and padding by using a transparent appbar with zero height
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Blue section with back button, texts, and full width image flush without extra space
            Container(
              color: blueColor,
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button top-left with padding
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),

                    // Texts with horizontal padding only
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Easy Tracking, Every Day,',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Full width silhouette image flush with blue background, no padding or margin
                    Image.asset(
                      'assets/images/sri_lanka_silhouette.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 160,
                    ),
                  ],
                ),
              ),
            ),

            // White section immediately below blue without extra padding at top
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Custom Tab toggle
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        // Register tab
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoginMode = false;
                                _tabController.animateTo(0);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color:
                                    !isLoginMode
                                        ? blueColor
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color:
                                      !isLoginMode ? Colors.white : blueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Login tab
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoginMode = true;
                                _tabController.animateTo(1);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color:
                                    isLoginMode
                                        ? blueColor
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: isLoginMode ? Colors.white : blueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    isLoginMode ? 'Employee Login' : 'Employee Registration',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    isLoginMode
                        ? 'Login as an Employee'
                        : 'Register as an Employee',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade400),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: const [
                            Text('+94'),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Phone Number',
                          ),
                          onChanged: (val) => phoneNumber = val,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (val) {
                              setState(() {
                                rememberMe = val ?? false;
                              });
                            },
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle phone number change
                        },
                        child: const Text('Change your Phone Number'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: onSendOTP,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('or'),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Center(
                    child: SizedBox(
                      width: 140, // smaller width for biometrics button
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Integrate biometric auth
                        },
                        icon: const Icon(Icons.fingerprint, size: 20),
                        label: const Text('Biometrics'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1F0FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Employee Benefits!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Where Loyalty is Rewarded. Stay up for amazing savings ahead',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'View More',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 80,
                          child: Image.asset(
                            'assets/images/train_card.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              color: blueColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
