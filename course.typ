// Course content is stored here once and reused from main.typ.
#let courses = (
  course1: (
  name: [Course Name 1],
  id: [Course Id 1],
  semester: [Semester 1],
  credit: [Credit 1],
  ects: [1],
  grade: [Grade 1],
  content: [
    - Chapter 1
    - Chapter 2
    - Chapter 3
  ],
  description: [
    The main body of Course Description 1 \
    #lorem(100)
  ],
  assessment: [
    - Assignment 1
    - Assignment 2
    - Assignment 3
    - Exam 1
    - Exam 2
  ],
  ),
  course2: (
  name: [Course Name 2],
  id: [Course Id 2],
  semester: [Semester 2],
  credit: [Credit 2],
  ects: [2],
  grade: [Grade 2],
  content: [
    - Chapter 1
    - Chapter 2
    - Chapter 3
  ],
  description: [
    The main body of Course Description 2 \
    #lorem(100)
  ],
  assessment: [
    - Assignment 1
    - Assignment 2
    - Assignment 3
    - Exam 1
    - Exam 2
  ],
  ),
)
