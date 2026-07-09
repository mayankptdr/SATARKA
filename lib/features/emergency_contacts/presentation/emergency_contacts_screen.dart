import 'package:flutter/material.dart';
import '../services/emergency_contact_service.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  List<Map<String, String>> contacts = [];

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    contacts = await EmergencyContactService.loadContacts();
    setState(() {});
  }

  Future<void> addContact() async {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) {
      return;
    }

    setState(() {
      contacts.add({
        "name": nameController.text,
        "phone": phoneController.text,
      });
    });

    await EmergencyContactService.saveContacts(contacts);

    nameController.clear();
    phoneController.clear();

    if (mounted) {
      Navigator.pop(context);
    }
  }

  void showAddDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add Emergency Contact"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: "Phone Number"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(onPressed: addContact, child: const Text("Save")),
          ],
        );
      },
    );
  }

  Future<void> deleteContact(int index) async {
    setState(() {
      contacts.removeAt(index);
    });

    await EmergencyContactService.saveContacts(contacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Emergency Contacts")),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
      body: contacts.isEmpty
          ? const Center(
              child: Text(
                "No Emergency Contacts",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (_, index) {
                final contact = contacts[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(contact["name"]!),
                    subtitle: Text(contact["phone"]!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deleteContact(index);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
