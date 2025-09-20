Read the task and plan
I read the assignment to understand objectives (generate performance + attendance reports). I sketched the required outputs: (a) show inserted data, (b) average marks %, (c) attendance %, (d) students with attendance < 70%.

Design the schema on paper
I drew a simple ER diagram with the tables I needed: Students, Subjects, Marks, and Attendance. I decided primary keys, foreign keys, and which fields to store (e.g., MarksObtained, MaxMarks, Status).

Create the database and tables
I opened my MySQL tool (MySQL Workbench / command line) and created the database and the four tables. I added foreign key constraints to keep data consistent and used meaningful column names.

Insert sample data
I populated the Students, Subjects, Marks, and Attendance tables with realistic test rows (4 students, 4 subjects, marks for each subject, a few attendance records). I kept dates and values simple so outputs are easy to check.

Run basic SELECTs to verify inserts
I ran SELECT * on each table to make sure data inserted correctly and foreign keys matched. If any row was wrong I fixed it and re-ran the select.

Write aggregation queries
I wrote queries to compute each required metric:

Student average marks as a percentage (use AVG over MarksObtained/MaxMarks * 100).

Attendance percentage per student (count present / total records * 100).
I tested each query and adjusted rounding/display to show two decimals.

Create views for reusable reports
To make the dashboard cleaner I saved the heavy queries as views (e.g., StudentAverage, StudentAttendance) so I could query them easily for top lists or filters.

Add the “low attendance” query
I used a HAVING clause on attendance percentage to return students with attendance < 70%. I tested edge cases (students with no records).

Order and format final output
I prepared final SELECTs in the order requested: first printed raw tables, then average marks table, then attendance
