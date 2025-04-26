import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StudentInfoScreen extends StatefulWidget {
  const StudentInfoScreen({super.key});

  @override
  State<StudentInfoScreen> createState() => _StudentInfoScreen();
}

class _StudentInfoScreen extends State<StudentInfoScreen> {
  // ✅ Dummy Data for One Student
  final Map<String, dynamic> studentData = {
    "name": "John Doe",
    "gradeLevel": "Grade 10",
    "section": "Section A",
    "attendance": {"Present": 50, "Absent": 10, "Late": 10, "Excused": 5},
    "grades": {"Math": 92, "Science": 88, "English": 81, "History": 90},
    "recentActivity": "John Doe attended Science class today.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Information", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF16213E),
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false, // Remove the burger icon
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _studentInfoCard(),
              const SizedBox(height: 20),
              _sectionTitle("Attendance Overview"),
              _attendanceSquares(),
              _attendanceChart(),
              const SizedBox(height: 20),
              _sectionTitle("Grades Overview"),
              _gradesSquares(),
              const SizedBox(height: 20),
              _sectionTitle("Recent Activity"),
              _recentActivityCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Section Title
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  // ✅ Student Information Card
  Widget _studentInfoCard() {
    return Card(
      color: Colors.white12,
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.white),
        title: Text(
          studentData["name"],
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${studentData["gradeLevel"]} - ${studentData["section"]}",
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

 Widget _attendanceSquares() {
  final present = studentData["attendance"]["Present"] as int;
  final absent = studentData["attendance"]["Absent"] as int;
  final late = studentData["attendance"]["Late"] as int;
  final excused = studentData["attendance"]["Excused"] as int;
  final total = present + absent + late + excused;

  final items = [
    {"label": "Total", "count": total, "color": Colors.blue, "icon": Icons.calendar_today},
    {"label": "Present", "count": present, "color": Colors.green, "icon": Icons.check_circle},
    {"label": "Absent", "count": absent, "color": Colors.red, "icon": Icons.cancel},
    {"label": "Late", "count": late, "color": Colors.orange, "icon": Icons.access_time},
    {"label": "Excused", "count": excused, "color": Colors.purple, "icon": Icons.info},
  ];

  return SizedBox(
    height: 120,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.mapIndexed((index, item) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: (item["color"] as Color).withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item["icon"] as IconData, color: Colors.white, size: 28),
                  const SizedBox(height: 8),
                  Text(
                    item["label"].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item["count"].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}


// ✅ Attendance Chart (Pie Chart)
Widget _attendanceChart() {
  final present = studentData["attendance"]["Present"].toDouble();
  final absent = studentData["attendance"]["Absent"].toDouble();
  final late = studentData["attendance"]["Late"].toDouble();
  final excused = studentData["attendance"]["Excused"].toDouble();

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,  // Align both items in the center vertically
    mainAxisAlignment: MainAxisAlignment.start,  // Align to the start horizontally
    children: [
      Expanded(
        flex: 2,
        child: SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                _buildPieSection("Present", present, Colors.green, 50),
                _buildPieSection("Absent", absent, Colors.red, 50),
                _buildPieSection("Late", late, Colors.orange, 50),
                _buildPieSection("Excused", excused, Colors.purple, 50),
              ],
              sectionsSpace: 5,
              centerSpaceRadius: 40,
            ),
          ),
        ),
      ),
      const SizedBox(width: 1), // Reduced space between the pie chart and the warning card
      Padding(
        padding: const EdgeInsets.only(left: 1), // Reduced space on the left of the warning card
        child: _absentWarningCard(studentData["attendance"]["Absent"]),
      ),
    ],
  );
}


  // ✅ Helper function to adjust labels dynamically
  PieChartSectionData _buildPieSection(String title, double value, Color color, double radius) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: radius,
      title: value > 5 ? title : "", // Hide text for very small values
      titleStyle: const TextStyle(
        fontSize: 12, // Adjusted for better visibility
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titlePositionPercentageOffset: 0.6, // Adjusts text position
    );
  }

  // ✅ Warning square if absents are high
Widget _absentWarningCard(int absentCount) {
  final bool tooManyAbsents = absentCount > 30;

  return Container(
    width: 140,
    height: 120,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: tooManyAbsents ? Colors.red.shade600 : Colors.green.shade600,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          offset: const Offset(2, 2),
          blurRadius: 4,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          tooManyAbsents ? Icons.warning_amber_rounded : Icons.check_circle_outline,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(height: 8),
        Text(
          tooManyAbsents ? "High Absences!" : "Attendance OK",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "$absentCount Absents",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ],
    ),
  );
}


// ✅ Colorful Grade Squares
Widget _gradesSquares() {
  final grades = studentData["grades"] as Map<String, int>;

  final Map<String, IconData> subjectIcons = {
    "Math": Icons.calculate,
    "Science": Icons.science,
    "English": Icons.language,
    "History": Icons.history_edu,
  };

  final List<Color> colorPalette = [
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.teal,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.green,
  ];

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: grades.entries.mapIndexed((index, entry) {
      final subject = entry.key;
      final grade = entry.value;
      final color = colorPalette[index % colorPalette.length];

      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(2, 2),
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(subjectIcons[subject] ?? Icons.book, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              subject,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              grade.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
  

  // ✅ Recent Activity Card
  Widget _recentActivityCard() {
    return Card(
      color: Colors.white12,
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.notifications, color: Colors.white),
        title: Text(
          studentData["recentActivity"],
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

// 👇 Paste outside any class
extension IndexedMap<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E e) f) {
    var index = 0;
    return map((e) => f(index++, e));
  }
}

