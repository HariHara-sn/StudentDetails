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
  // final String name2;
  // final String rollno;
  // final String ph;
  // final String mail;
  // final String dob;
  // final String gender;
  // final String degree;
  // final String blood_group;
  // final String regno;
  // final String community;
  final String name;
  final String rollno;
  final String regno;
  final String dob;
  final String clg_mail;
  final String mobileno;
  final String blood_group;
  final String degree;
  final String community;
  final String pers_mail;
  final String _10thmark;
  final String _10thpercentage;
  final String _12thmark;
  final String _12th_per;
  final String _12thcutoff;
  final String diplomapercentage;
  final String quota;
  final String _1stsemestergpa;
  final String _2ndsemestergpa;
  final String _3rdsemestergpa;
  final String cgpa;
  final String historyofarrears;
  final String curr_arrear;

  const LandingPageProfile(
    // this.name2,
    // this.rollno,
    // this.ph,
    // this.mail,
    // this.dob,
    // this.gender,
    // this.degree,
    // this.blood_group,
    // this.regno,
    // this.community,
    this.name,
    this.rollno,
    this.regno,
    this.dob,
    this.clg_mail,
    this.mobileno,
    this.blood_group,
    this.degree,
    this.community,
    this.pers_mail,
    this._10thmark,
    this._10thpercentage,
    this._12thmark,
    this._12th_per,
    this._12thcutoff,
    this.diplomapercentage,
    this.quota,
    this._1stsemestergpa,
    this._2ndsemestergpa,
    this._3rdsemestergpa,
    this.cgpa,
    this.historyofarrears,
    this.curr_arrear, {
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
                    'name': widget.name,
                    'rollno': widget.rollno,
                    'regno': widget.regno,
                    'dob': widget.dob,
                    'clg_mail': widget.clg_mail,
                    'mobileno': widget.mobileno,
                    'blood_group': widget.blood_group,
                    'degree': widget.degree,
                    'community': widget.community,
                    'pers_mail': widget.pers_mail,
                    '10thmark': widget._10thmark,
                    '10thpercentage': widget._10thpercentage,
                    '12thmark': widget._12thmark,
                    '12th_per': widget._12th_per,
                    '12thcutoff': widget._12thcutoff,
                    'diplomapercentage': widget.diplomapercentage,
                    'quota': widget.quota,
                    '1stsemestergpa': widget._1stsemestergpa,
                    '2ndsemestergpa': widget._2ndsemestergpa,
                    '3rdsemestergpa': widget._3rdsemestergpa,
                    'cgpa': widget.cgpa,
                    'historyofarrears': widget.historyofarrears,
                    'curr_arrear': widget.curr_arrear
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
              widget.name,
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
                    // Profile('Name', Icons.person, item['name']),
                    // Profile('Rollno', Icons.assignment_ind, item['rollno']),
                    // Profile('Phone', Icons.phone, item['phone']),
                    // Profile('mail', Icons.mail, item['mail'].toString()),
                    // Profile('DOB', Icons.calendar_month_rounded, item['dob']),
                    // Profile('Gender', Icons.male_rounded, item['gender']),
                    // Profile('Degree', Icons.workspace_premium, item['degree']),
                    // Profile(
                    //     'BloodGroup', Icons.water_drop, item['blood_group']),
                    // Profile('Degree', Icons.workspace_premium, item['degree']),
                    // Profile(
                    //     'Degree', Icons.workspace_premium, item['community']),

                    Profile('Name', Icons.person, item['name']),
                    Profile('Rollno', Icons.assignment_ind, item['rollno']),
                    Profile('Regno', Icons.perm_identity, item['regno']),
                    Profile('DOB', Icons.date_range, item['dob']),
                    Profile('College Email', Icons.email, item['clg_mail']),
                    Profile('Mobile Number', Icons.phone, item['mobileno']),
                    Profile('Blood Group', Icons.local_hospital, item['blood_group']),
                    Profile('Degree', Icons.school, item['degree']),
                    Profile('Community', Icons.group, item['community']),
                    Profile('Personal Email', Icons.email, item['pers_mail']),
                    Profile('10th Mark', Icons.assignment, item['10thmark']),
                    Profile('10th Percentage', Icons.assignment, item['10thpercentage']),
                    Profile('12th Mark', Icons.assignment, item['12thmark']),
                    Profile('12th Percentage', Icons.assignment, item['12th_per']),
                    Profile('12th Cutoff', Icons.assignment, item['12thcutoff']),
                    Profile('Diploma Percentage', Icons.assignment,item['diplomapercentage']),
                    Profile('Quota', Icons.assignment, item['quota']),
                    Profile('1st Semester GPA', Icons.assignment,item['1stsemestergpa']),
                    Profile('2nd Semester GPA', Icons.assignment,item['2ndsemestergpa']),
                    Profile('3rd Semester GPA', Icons.assignment,item['3rdsemestergpa']),
                    Profile('CGPA', Icons.assignment, item['cgpa']),
                    Profile('History of Arrears', Icons.warning, item['historyofarrears']),
                    Profile(
                        'Current Arrear', Icons.warning, item['curr_arrear'])

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
