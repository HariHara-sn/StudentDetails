import 'package:flutter/material.dart';
import 'package:studentportfolio/api.dart';


List data = [];

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiEndpoint(),
    ),
  );
}

class LandingPageProfile extends StatefulWidget {
  final String name2;
  final String rollno;
  final String ph;
  final String mail;
  final String dob;
  final String gender;
  final String degree;
  final String blood_group;

  const LandingPageProfile(
    this.name2,
    this.rollno,
    this.ph,
    this.mail,
    this.dob,
    this.gender,
    this.degree,
    this.blood_group, {
    Key? key,
  }) : super(key: key);

  @override
  State<LandingPageProfile> createState() => _LandingPageProfileState();
}

class _LandingPageProfileState extends State<LandingPageProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDetail(
                [
                  {
                    'name': widget.name2,
                    'rollno': widget.rollno,
                    'phone': widget.ph,
                    'mail': widget.mail,
                    'dob': widget.dob,
                    'gender': widget.gender,
                    'degree': widget.degree,
                    'blood_group': widget.blood_group,
                  }
                ],
              ),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                'assets/user.jpg',
              ),
            ),
          ),
          title: Center(
            child: Text(
              widget.name2,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          trailing: const Icon(Icons.arrow_right_alt),
        ),
      ),
    );
  }
}

class StudentDetail extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const StudentDetail(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Detail'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          // Image.asset('assets/freepik.jpg'),
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 90,
              child: ClipOval(
                child: Image.asset(
                  'assets/HARI HARA SUDHAN-22IT14.jpg',
                  width: 160,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var item in data)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Profile('Name', Icons.person, item['name']),
                    Profile('Rollno', Icons.assignment_ind, item['rollno']),
                    Profile('Phone', Icons.phone, item['phone']),
                    Profile('mail', Icons.mail, item['mail'].toString()),
                    Profile('DOB', Icons.calendar_month_rounded, item['dob']),
                    Profile('Gender', Icons.male_rounded, item['gender']),
                    Profile('Degree', Icons.workspace_premium, item['degree']),
                    Profile(
                        'BloodGroup', Icons.water_drop, item['blood_group']),

                    // Add more Profile widgets for other details if needed
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String name;
  final IconData icon;
  final String subtitle;

  const Profile(this.name, this.icon, this.subtitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Color iconColor = Colors.black; // Default icon color
    if (name == 'BloodGroup') {
      iconColor = Colors.red; // Set color to red for 'BloodGroup'
    } else if (name == 'Degree') {
      iconColor = const Color.fromARGB(255, 255, 200, 1);
    }
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
        ),
        title: Text(
          name,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
