import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String currentLanguage;
  final ValueChanged<String> onLanguageChanged;

  const SettingsScreen({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late String _tempLanguage;
  final Color safirColor = const Color(0xFF145A41);

  @override
  void initState() {
    super.initState();
    _tempLanguage = widget.currentLanguage;
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                Icon(Icons.language, color: safirColor),
                const SizedBox(width: 8),
                const Text('انتخاب زبان', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('دری'),
                  trailing: _tempLanguage == 'دری' ? Icon(Icons.check_circle, color: safirColor) : null,
                  onTap: () {
                    setState(() => _tempLanguage = 'دری');
                    widget.onLanguageChanged('دری');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('پشتو'),
                  trailing: _tempLanguage == 'پشتو' ? Icon(Icons.check_circle, color: safirColor) : null,
                  onTap: () {
                    setState(() => _tempLanguage = 'پشتو');
                    widget.onLanguageChanged('پشتو');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('English'),
                  trailing: _tempLanguage == 'English' ? Icon(Icons.check_circle, color: safirColor) : null,
                  onTap: () {
                    setState(() => _tempLanguage = 'English');
                    widget.onLanguageChanged('English');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: const Text('تنظیمات', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.withOpacity(0.15))),
              child: ListTile(
                leading: Icon(Icons.language, color: safirColor),
                title: const Text('زبان برنامه (Language)', style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text('زبان فعلی: $_tempLanguage', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                trailing: const Icon(Icons.chevron_left, color: Colors.grey),
                onTap: _showLanguageDialog,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              elevation: 0,
              color: Colors.white.withOpacity(0.7),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.withOpacity(0.1))),
              child: const ListTile(
                leading: Icon(Icons.dark_mode_outlined, color: Colors.grey),
                title: Text('حالت شب (قالب آینده)', style: TextStyle(color: Colors.grey)),
                trailing: Icon(Icons.lock_outline, color: Colors.grey, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
