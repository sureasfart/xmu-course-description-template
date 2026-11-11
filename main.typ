#import "template.typ": template, course
#import "course.typ": courses

#show: template.with(
  university: "Your University",
  major: "Your Degree Programme",
  school: "",
  name: "Your Name",
  id: "Your Student ID",
  // The cover image settings
   // cover: none,
  cover: (
    logo_path: "logo.png",
    logo_width: 100%,
    logo_with_university_name: true,
  ),
  // 可选是否需要logo

  // The watermark image settings as the background of the document
  // watermark: (
  //   img_path: "",
  //   img_width: 160mm,
  // ),
  // 这里注释了水印设置
)


// Rearrange the category headings and course calls below for each application.
// Edit the course descriptions in course.typ.

= Category 1

#course(..courses.course1)

= Category 2

#course(..courses.course2)
