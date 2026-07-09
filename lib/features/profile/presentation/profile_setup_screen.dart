import 'package:flutter/material.dart';
import '../../../core/user/user_service.dart';
import '../../home/presentation/home_screen.dart';
import '../../../core/theme/app_theme.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController emergencyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String selectedGender = "Male";

  String selectedBloodGroup = "A+";

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    emergencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(title: const Text("Complete Your Profile")),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 10),

                const Text(
                  "Welcome to SATARKA 👋",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Let's personalize your healthcare experience.",
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 16),
                ),

                const SizedBox(height: 35),

                TextFormField(
                  controller: nameController,

                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: ageController,

                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    labelText: "Age",
                    prefixIcon: Icon(Icons.cake),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your age";
                    }

                    final age = int.tryParse(value);

                    if (age == null || age <= 0 || age > 120) {
                      return "Enter a valid age";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: selectedGender,

                  decoration: const InputDecoration(
                    labelText: "Gender",
                    prefixIcon: Icon(Icons.wc),
                  ),

                  items: const [
                    DropdownMenuItem(value: "Male", child: Text("Male")),

                    DropdownMenuItem(value: "Female", child: Text("Female")),

                    DropdownMenuItem(value: "Other", child: Text("Other")),
                  ],

                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: selectedBloodGroup,

                  decoration: const InputDecoration(
                    labelText: "Blood Group",
                    prefixIcon: Icon(Icons.bloodtype),
                  ),

                  items: const [
                    DropdownMenuItem(value: "A+", child: Text("A+")),

                    DropdownMenuItem(value: "A-", child: Text("A-")),

                    DropdownMenuItem(value: "B+", child: Text("B+")),

                    DropdownMenuItem(value: "B-", child: Text("B-")),

                    DropdownMenuItem(value: "AB+", child: Text("AB+")),

                    DropdownMenuItem(value: "AB-", child: Text("AB-")),

                    DropdownMenuItem(value: "O+", child: Text("O+")),

                    DropdownMenuItem(value: "O-", child: Text("O-")),
                  ],

                  onChanged: (value) {
                    setState(() {
                      selectedBloodGroup = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: emergencyController,

                  keyboardType: TextInputType.phone,

                  decoration: const InputDecoration(
                    labelText: "Emergency Contact (Optional)",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      await UserService.saveUser(
                        name: nameController.text.trim(),
                        age: int.parse(ageController.text),
                        gender: selectedGender,
                      );

                      if (!context.mounted) return;

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },

                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
