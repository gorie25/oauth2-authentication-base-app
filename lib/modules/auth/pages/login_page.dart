import 'package:flutter/material.dart';
import 'package:oauth2_auth_app/local_auth_biometric/local_auth.dart';
import 'package:oauth2_auth_app/locator/locator.dart';
import 'package:oauth2_auth_app/usecases/send_otp_usecase.dart';
import 'package:local_auth/local_auth.dart';
import 'package:oauth2_auth_app/storage/spref.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SendOtpUseCase _sendOtpUseCase = locator<SendOtpUseCase>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Title
              Text('Đăng Nhập', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),

              // Phone Number Field
              TextField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Số Điện Thoại',
                  hintText: 'Nhập số điện thoại',
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Mật Khẩu',
                  hintText: 'Nhập mật khẩu',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),

              // Get OTP Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _sendOtpUseCase.run(phoneNumber: _phoneController.text, locale: 'vi');
                  },
                  icon: const Icon(Icons.sms),
                  label: const Text('Lấy Mã OTP'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    SPref.instance.setPassword(_passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Đăng Nhập', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text('Hoặc', style: TextStyle(color: Colors.grey[600]))),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 30),

              // Social Login Icons
              GestureDetector(
                onTap: () async {
                  final localAuth = LocalAuthService();
                  await localAuth.canCheckBio();
                  final authenticated = await localAuth.authenticate();
                  if (authenticated) {
                    final savedPassword = await SPref.instance.getPassword();
                    setState(() {
                      _passwordController.text = savedPassword ?? '';
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(12)),
                  child: Image.asset('assets/face_id.png', width: 60, height: 60, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
