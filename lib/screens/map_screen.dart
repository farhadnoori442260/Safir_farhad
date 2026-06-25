import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class SafirMapScreen extends StatefulWidget {
  final String serviceType;
  const SafirMapScreen({super.key, required this.serviceType});

  @override
  State<SafirMapScreen> createState() => _SafirMapScreenState();
}

class _SafirMapScreenState extends State<SafirMapScreen> {
  int _selectedCategory = 0; 
  int _selectedVehicleType = 0; 
  int _currentStep = 0; 
  final Color safirColor = const Color(0xFF145A41);

  String _originAddress = 'چهارراهی صدارت';
  String _destinationAddress = 'چهارراهی کلوله پشته';

  void _showAdvancedProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 45, height: 4.5, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context); 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey[100],
                            child: Icon(Icons.person, size: 42, color: Colors.grey[400]),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('farhadnoori', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              Text('۰۹۹۰۷۰۲۷۱۲۳', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.chevron_left, color: Colors.grey[600], size: 28),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(height: 1, thickness: 0.5),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.history, color: Colors.black87),
                  title: const Text('سفرها'),
                  trailing: const Icon(Icons.chevron_left),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.settings_outlined, color: Colors.black87),
                  title: const Text('تنظیمات حساب'),
                  trailing: const Icon(Icons.chevron_left),
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddressField(String text, IconData icon, Color iconColor) {
    return Container(
      width: double.infinity, 
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)]
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16),
          const SizedBox(width: 12),
          Text(text, style: TextStyle(color: safirColor, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildBottomButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity, height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: safirColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildCategoryTab(int categoryIndex, String label) {
    bool isCategorySelected = _selectedCategory == categoryIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() { _selectedCategory = categoryIndex; _selectedVehicleType = 0; }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: isCategorySelected ? safirColor : Colors.transparent, width: 2))),
          child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: isCategorySelected ? safirColor : Colors.grey, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildHorizontalVehicleOption(int index, IconData icon, String title, String subtitle, String price) {
    bool isSelected = _selectedVehicleType == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedVehicleType = index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? safirColor.withOpacity(0.05) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? safirColor : Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                const SizedBox(width: 10),
                Icon(icon, color: safirColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color(0xFFE8ECE9), 
              child: Stack(
                children: [
                  Positioned(top: 200, left: -50, child: Container(width: 500, height: 40, color: Colors.white)),
                  Positioned(top: 450, left: -50, child: Container(width: 500, height: 40, color: Colors.white)),
                  Positioned(top: -50, left: 100, child: Container(width: 40, height: 900, color: Colors.white)),
                  Positioned(top: -50, left: 280, child: Container(width: 40, height: 900, color: Colors.white)),
                  
                  Positioned(
                    top: 220, left: 120,
                    child: Container(width: 180, height: 8, color: Colors.green.shade600),
                  ),
                  Positioned(
                    top: 220, left: 280,
                    child: Container(width: 8, height: 250, color: Colors.green.shade600),
                  ),

                  Positioned(
                    top: 205, left: 105,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: safirColor, borderRadius: BorderRadius.circular(4)),
                          child: const Text('مبدأ', style: TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                        Icon(Icons.location_on, color: safirColor, size: 36),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 440, left: 266,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: Colors.red.shade700, borderRadius: BorderRadius.circular(4)),
                          child: const Text('مقصد', style: TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                        Icon(Icons.location_on, color: Colors.red.shade700, size: 36),
                      ],
                    ),
                  ),

                  Positioned(top: 310, left: 110, child: Icon(Icons.local_taxi, color: safirColor.withOpacity(0.6), size: 24)),
                  Positioned(top: 455, left: 40, child: Icon(Icons.motorcycle, color: Colors.orange, size: 24)),
                ],
              ),
            ),

            // پروفایل سمت چپ
            Positioned(
              top: 50, left: 20,
              child: FloatingActionButton(
                heroTag: 'profile_btn', mini: true, backgroundColor: Colors.white,
                onPressed: _showAdvancedProfile,
                child: Icon(Icons.person, color: safirColor),
              ),
            ),
            
            // هوم سمت راست
            Positioned(
              top: 50, right: 20,
              child: FloatingActionButton(
                heroTag: 'home_btn', mini: true, backgroundColor: Colors.white,
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.home, color: safirColor),
              ),
            ),

            if (_currentStep == 0)
              Positioned(
                bottom: 30, left: 15, right: 15,
                child: Column(
                  children: [
                    _buildAddressField(_originAddress, Icons.circle, safirColor),
                    const SizedBox(height: 12),
                    _buildBottomButton('تایید مبدأ', () => setState(() => _currentStep = 1)),
                  ],
                ),
              ),

            if (_currentStep == 1)
              Positioned(
                bottom: 30, left: 15, right: 15,
                child: Column(
                  children: [
                    _buildAddressField(_destinationAddress, Icons.location_on, Colors.red),
                    const SizedBox(height: 12),
                    _buildBottomButton('تایید مقصد', () => setState(() => _currentStep = 2)),
                  ],
                ),
              ),

            if (_currentStep == 2)
              Positioned(
                bottom: 25, left: 15, right: 15,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)]
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          _buildCategoryTab(1, 'موترسایکل'),
                          _buildCategoryTab(0, 'موتر'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (_selectedCategory == 0) ...[
                        _buildHorizontalVehicleOption(0, Icons.local_taxi, 'سفير اقتصادی', 'ارزان و سریع', '۱۲۰ افغانی'),
                        const SizedBox(height: 8),
                        _buildHorizontalVehicleOption(1, Icons.electric_car, 'سفير ویژه', 'لوکس و راحت', '۱۸۰ افغانی'),
                      ] else ...[
                        _buildHorizontalVehicleOption(0, Icons.motorcycle, 'سفير موتور', 'عبور از ترافیک', '۶۰ افغانی'),
                      ],
                      const SizedBox(height: 12),
                      _buildBottomButton('درخواست سفیر', () => setState(() => _currentStep = 3)),
                    ],
                  ),
                ),
              ),

            if (_currentStep == 3)
              Positioned(
                bottom: 25, left: 15, right: 15,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(safirColor)),
                      const SizedBox(height: 15),
                      const Text('در حال ارسال درخواست به راننده‌ها...', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => setState(() => _currentStep = 2),
                          child: const Text('لغو درخواست', style: TextStyle(color: Colors.red)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
