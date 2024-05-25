// ignore_for_file: non_constant_identifier_names

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
  // print('hello');
  // print(data.length);
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
  // final String img;
  final String name;
  final String image;
  final String rollno;
  final String regno;
  final String dob;
  final String clg_mail;
  final String pers_mail;
  final String host_das;
  final String stud_mobileno;
  final String Parent_mobileno;
  final String alter_parent_mobileno;
  final String blood_group;
  final String community;
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
  final String arrear;
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
    // this.community,

    this.name,
    this.image,
    this.rollno,
    this.regno,
    this.dob,
    this.clg_mail,
    this.pers_mail,
    this.host_das,
    this.stud_mobileno,
    this.Parent_mobileno,
    this.alter_parent_mobileno,
    this.blood_group,
    this.community,
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
    this.arrear,
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
                    'img': widget.image,
                    'rollno': widget.rollno,
                    'regno': widget.regno,
                    'dob': widget.dob,
                    'clg_mail': widget.clg_mail,
                    'personal_mail':widget.pers_mail,
                    'mobileno': widget.stud_mobileno,
                    'hostal_or_dascollar': widget.host_das,
                    'stud_mobileno': widget.stud_mobileno,
                    'parent_mobileno': widget.Parent_mobileno,
                    'alternative_parent_mobileno': widget.alter_parent_mobileno,
                    'blood_group': widget.blood_group,
                    'community': widget.community,
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
                    'count': widget.arrear,
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
              // child: Image.network('https://i.imgur.com/Yas9TtE.jpeg'),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var item in data)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: CircleAvatar(
                        radius: 90,
                        child: ClipOval(
                          child: Image.network(
                            // 'assets/user2.jpg',
                            item['img'], width: 160,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    Profile('Name', Icons.person, item['name']),
                    Profile('Rollno', Icons.assignment_ind, item['rollno']),
                    Profile('Regno', Icons.perm_identity, item['regno']),
                    Profile('DOB', Icons.calendar_month_rounded, item['dob']),
                    Profile('Official mail', Icons.email, item['clg_mail']),
                    Profile('Personal mail', Icons.email, item['personal_mail']),
                    Profile('Mobile Number', Icons.phone, item['mobileno']),
                    Profile('Hostel or Day Scholar', Icons.home,
                        item['hostal_or_dascollar']),
                    Profile('Parent Mobile Number', Icons.phone,
                        item['parent_mobileno']),
                    Profile(
                        'Alternative Parent Mobile Number',
                        Icons.phone_in_talk,
                        item['alternative_parent_mobileno']),
                    Profile('Blood Group', Icons.water_drop,
                        item['blood_group']),
                    Profile('Community', Icons.people, item['community']),
                    Profile('10th Mark', Icons.school, item['10thmark']),
                    Profile('10th Percentage', Icons.percent,
                        item['10thpercentage']),
                    Profile('12th Mark', Icons.school, item['12thmark']),
                    Profile('12th Percentage', Icons.percent, item['12th_per']),
                    Profile('12th Cutoff', Icons.local_activity_sharp, item['12thcutoff']),
                    Profile('Diploma Percentage', Icons.score,
                        item['diplomapercentage']),
                    Profile('Quota', Icons.assignment, item['quota']),
                    Profile('1st Semester GPA', Icons.star_rate_rounded,
                        item['1stsemestergpa']),
                    Profile('2nd Semester GPA', Icons.star_rate_rounded,
                        item['2ndsemestergpa']),
                    Profile('3rd Semester GPA', Icons.star_rate_rounded,
                        item['3rdsemestergpa']),
                    Profile('CGPA', Icons.workspace_premium, item['cgpa']),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text(item['count']),
                                  content: const Text('This is my content'),
                                ));
                      },
                      child: Profile('History of Arrears', Icons.warning,
                          item['historyofarrears']),
                    ),
                    Profile(
                        'Current Arrear', Icons.warning, item['curr_arrear'])

                    // Add more Profile widgets for other details if needed
                  ],
                ),
            ],
          ),
        ));
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
    final iconColorMap = {
      'Blood Group': Colors.red,
      'CGPA': const Color.fromARGB(255, 255, 200, 1),
      '1st Semester GPA': Colors.purple[200],
      '2nd Semester GPA': Colors.purple[200],
      '3rd Semester GPA': Colors.purple[200],
    };
    final iconColor = iconColorMap[name] ?? Colors.black;

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
      child: Column(
        children: [
          ListTile(
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
        ],
      ),
    );
  }
}
