#let template(
  university: none,
  major: none,
  school: none,
  name: none,
  id: none,
  cover: none,
  watermark: none,
  doc,
) = {
  // Cover
   page()[
    #align(center)[
      #if cover != none {
        image(cover.logo_path, width: cover.logo_width)
      }
     
      #text(weight: "bold", size: 30pt)[#university]

      #text(weight: "bold", size: 30pt, "Course Description")
      #v(2fr)
      #text(weight: "semibold", size: 16pt)[#major]
      #parbreak()
      #text(weight: "semibold", size: 18pt)[#school]
      #v(5fr)
      #text(size: 16pt)[Name: #name]
      #parbreak()
      #text(size: 16pt)[Student No.: #id]
      #parbreak()
      // #text(weight: "semibold", size: 18pt)[#school]
    ]
    #v(3fr)
    #set text(weight: "medium", size: 14pt)
  ]
  
  // Credit System Explanation Page
  page(
    footer: [#h(1fr)]
  )[
    #align(center)[
      #text(weight: "bold", size: 18pt)[Credit System Explanation]
    ]
    
    #v(1em)
    
    #set par(justify: true, leading: 0.65em)
    #set text(size: 11pt)
    
    This document describes courses taken at *#university*. The credit system at #university differs from the European Credit Transfer and Accumulation System (ECTS). The following conversion and workload information applies based on the official transcript regulations:
    
    #v(1em)

    - Our minimum curriculum credits for graduation (including courses and practicum)：*148 Credits*.
    - In Europe, 60 ECTS credits are the equivalent of a full year of study or work. The number of minimum ECTS for 4-year bachelor degree is *240*. Therefore, the conversion ratio between Original Credit and ECTS is:
    #align(center)[
      *1 Original Credit corresponding to 1.6 ECTS*
    ]
    #v(1em)
    
    #table(
      columns: (auto, 1fr),
      stroke: 0.5pt,
      inset: 10pt,
      [*Our Credit*], [1 credit point],
      [*ECTS Equivalent*], [≈ 1.6 ECTS],
      [*Theory courses*], [Approximately 16 class hours per credit],
      [*Practical / experimental courses*], [Approximately 32 class hours per credit],
    )
    
    #v(1em)
    
    The credit system is defined as follows:

    - *Theory Courses*: One credit is awarded for every 16 schooling hours of instruction.
  
    - *Practical / experimental courses*: One credit is awarded for every 32 schooling hours of practical training.

  ]

  // Page settings
  set page(
    header: [
      Course Description - #name
      #h(1fr)
      #university
    ],
    footer: context [
      #counter(page).display("1 / 1", both: true)
      #h(1fr)
    ],
    // background: image(
    //   watermark.img_path,
    //   width: watermark.img_width,
    // )
    // 
    // 这里注释了水印背景设置
  )

// Table of contents
  page(footer: [#h(1fr)])[
    #show outline.entry.where(level: 2): it => {
      let loc = it.element.location()
      
      context {
        let m = query(selector(<course_ects>).after(loc))
        
        if m != () and m.first().location().page() == loc.page() {
          let ects_val = m.first().value
          
          // 使用 it.indented 处理缩进，并将标题、学分、虚线、页码放在同一个块中
          it.indented(
            it.prefix(), // 自动获取 1.1, 2.1 等编号
            [
              #link(loc)[
              #it.element.body
              #h(0.4em)
              #text(style: "italic", fill: gray.darken(20%), weight: "regular")[(#ects_val ECTS)]
            ]
            #box(width: 1fr, it.fill)
            // 页码通常也建议包裹在 link 中，方便点击
            #link(loc)[#it.page()]
            ]
          )
        } else {
          it
        }
      }
    }
    
    #outline(
      title: "Table of Contents",
      indent: 2em,
    )
  ]
  
  // Main body
  counter(page).update(1)
  set par(justify: true)
  set heading(numbering: "1.1.")
  doc
}

#let course(
  name: none,
  id: none,
  semester: none,
  credit: none,
  ects: none,
  hours: none,
  grade: none,
  preparatory: none,
  prerequisite: none,
  content: none,
  description: none,
  assessment: none,
) = {
  
  heading(depth: 2)[
    #name
    #metadata(ects) <course_ects>
  ]
  let cells = (
    ([*Course Title*], name),
    ([*Course No.*], id),
    ([*Semester*], semester),
    ([*Credit*], credit),
    ([*ECTS Equivalent*], ects),
    ([*Course Hours*], hours),
    ([*My Grade*], grade),
    ([*Preparatory Course(s)*], preparatory),
    ([*Prerequisite(s)*], prerequisite),
    ([*Content*], content),
    ([*Course Description*], description),
    ([*Assessment*], assessment),
  )
  let table_args = ()
  for row in cells {
    if row.at(1) != none {
      table_args.push(row.at(0))
      table_args.push(row.at(1))
    }
  }
  table(
    columns: (auto, 1fr),
    ..table_args,
  )
}
