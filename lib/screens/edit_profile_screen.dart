import 'package:flutter/material.dart';
import '../widgets/premium_switch.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'farhadnoori');
  final TextEditingController _phoneController = TextEditingController(text: '+۹۳۷۹۹۰۷۰۲۷۱');
  final TextEditingController _emailController = TextEditingController(text: 'farhadnoori442@gmail.com');
  final TextEditingController _addressController = TextEditingController(text: 'کابل، افغانستان');

  bool _isPremium = true;

  Widget _buildInputField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF145A41), width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('اطلاعات کاربری', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اطلاعات اصلی',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF145A41)),
              ),
              const SizedBox(height: 10),
              
              _buildInputField(_nameController, 'نام و نام خانوادگی'),
              _buildInputField(_phoneController, 'شماره تلفن'),
              _buildInputField(_emailController, 'ایمیل'),
              _buildInputField(_addressController, 'آدرس سکونت'),
              
              const SizedBox(height: 35),
              const Divider(thickness: 0.8),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'حساب کاربری ویژه (Premium)',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'فعال‌سازی قابلیت‌های پیشرفته برنامه',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                  SafirPremiumSwitch(
                    value: _isPremium,
                    onChanged: (newValue) {
                      setState(() {
                        _isPremium = newValue;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
