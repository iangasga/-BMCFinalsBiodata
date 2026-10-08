import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BioDataApp());
}

class BioDataApp extends StatelessWidget {
  const BioDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bio Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const BioDataPage(),
    );
  }
}

class BioDataPage extends StatefulWidget {
  const BioDataPage({super.key});

  @override
  State<BioDataPage> createState() => _BioDataPageState();
}

class _BioDataPageState extends State<BioDataPage> {
  final _formKey = GlobalKey<FormState>();

  // Personal Info Controllers
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final birthdateController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final addressController = TextEditingController();
  
  // Additional Bio Data Details
  final nationalityController = TextEditingController();
  final religionController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  
  // Family Background Controllers
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();

  // Contact Info Controllers
  final contactController = TextEditingController();
  final emailController = TextEditingController();

  String gender = 'Male';
  String civilStatus = 'Single';

  void saveBioData() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Since there's no Firebase, we can process or display the data locally here.
    // Halimbawa: I-print sa console o ipakita sa isang Dialog/Summary screen.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bio Data validated and saved locally successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    birthdateController.dispose();
    placeOfBirthController.dispose();
    addressController.dispose();
    nationalityController.dispose();
    religionController.dispose();
    heightController.dispose();
    weightController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum Vitae / Bio Data'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Banner Card
              Card(
                elevation: 4,
                color: Colors.indigo.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(Icons.person_pin, size: 50, color: Colors.indigo),
                      SizedBox(height: 10),
                      Text(
                        'BIODATA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Please fill out all the necessary information below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 1. Personal Information Section
              _buildSectionHeader('I. Personal Information'),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name (Last Name, First Name, Middle Name)',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Age',
                                prefixIcon: Icon(Icons.cake),
                                border: OutlineInputBorder(),
                              ),
                              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            flex: 3,
                            child: DropdownButtonFormField<String>(
                              value: gender,
                              decoration: const InputDecoration(
                                labelText: 'Gender',
                                prefixIcon: Icon(Icons.wc),
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'Male', child: Text('Male')),
                                DropdownMenuItem(value: 'Female', child: Text('Female')),
                              ],
                              onChanged: (val) => setState(() => gender = val!),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: birthdateController,
                              decoration: const InputDecoration(
                                labelText: 'Birthdate',
                                prefixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(),
                              ),
                              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: TextFormField(
                              controller: placeOfBirthController,
                              decoration: const InputDecoration(
                                labelText: 'Place of Birth',
                                prefixIcon: Icon(Icons.location_city),
                                border: OutlineInputBorder(),
                              ),
                              validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: addressController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Current Address',
                          prefixIcon: Icon(Icons.home),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Physical & Background Details Section
              _buildSectionHeader('II. Physical & Background Details'),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: civilStatus,
                              decoration: const InputDecoration(
                                labelText: 'Civil Status',
                                prefixIcon: Icon(Icons.favorite_border),
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'Single', child: Text('Single')),
                                DropdownMenuItem(value: 'Married', child: Text('Married')),
                                DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
                              ],
                              onChanged: (val) => setState(() => civilStatus = val!),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: TextFormField(
                              controller: nationalityController,
                              decoration: const InputDecoration(
                                labelText: 'Nationality',
                                prefixIcon: Icon(Icons.flag),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: religionController,
                              decoration: const InputDecoration(
                                labelText: 'Religion',
                                prefixIcon: Icon(Icons.church),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: TextFormField(
                              controller: heightController,
                              decoration: const InputDecoration(
                                labelText: 'Height',
                                prefixIcon: Icon(Icons.height),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: TextFormField(
                              controller: weightController,
                              decoration: const InputDecoration(
                                labelText: 'Weight',
                                prefixIcon: Icon(Icons.line_weight),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 3. Family Background Section
              _buildSectionHeader('III. Family Background'),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fatherNameController,
                        decoration: const InputDecoration(
                          labelText: "Father's Name",
                          prefixIcon: Icon(Icons.man),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: motherNameController,
                        decoration: const InputDecoration(
                          labelText: "Mother's Maiden Name",
                          prefixIcon: Icon(Icons.woman),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 4. Contact Information Section
              _buildSectionHeader('IV. Contact Information'),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: contactController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Contact Number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'Required';
                          if (!v.contains('@') || !v.contains('.')) return 'Invalid email';
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Save Button
              ElevatedButton.icon(
                onPressed: saveBioData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                icon: const Icon(Icons.save),
                label: const Text(
                  'SAVE BIO DATA',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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