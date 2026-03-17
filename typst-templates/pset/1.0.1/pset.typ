//
// PACKAGES
// 
// https://github.com/Leedehai/typst-physics
#import "@preview/physica:0.9.5": *

// https://github.com/janekfleper/typst-fancy-units
#import "@preview/fancy-units:0.1.1": *

// https://github.com/ryuryu-ymj/mannot
#import "@preview/mannot:0.3.0": *

// https://github.com/cetz-package/cetz
#import "@preview/cetz:0.4.2"

// https://github.com/jbirnick/typst-rich-counters
#import "@preview/rich-counters:0.2.2": *

// https://github.com/jbirnick/typst-great-theorems
#import "@preview/great-theorems:0.1.2": *


//
// SHORTCUTS
// 
#let MY_NAME = "Crystal McArdle-Ventura"
#let bound(expression, lo, hi) = $lr(#expression|)_#lo^#hi$
#let eval(expression, evaluateat) = $lr(#expression|)_#evaluateat$
#let int = sym.integral
#let vv(var) = $bold(upright(arrow(var)))$
#let ddot(var) = $dot.double(var)$
#let mag(var) = $lr(||var||)$

#let UNITS = (
  Ohm: sym.Omega
)

#let angle(content) = $lr(#sym.angle.l #content #sym.angle.r)$

// Astro stuff
#let Sun = math.dot.o
#let Earth = math.plus.o

// E&M stuff
#let emf = "ℰ"

// Linear algebra stuff
#let span = "span"

// unit shorthands
#let meter = unit[m]
#let second = unit[s]
#let newton = unit[N]
#let joule = unit[J]
#let coulomb = unit[C]
#let volt = unit[V]
#let evolt = unit[eV]
#let ohm = unit[Ohm]
#let farad = unit[F]
#let ampere = unit[A]
#let tesla = unit[T]
#let gauss = unit[G]
#let henry = unit[H]


//
// Automatic equality
// 
// #let equals(expression) = {
//   expression = #(expression)
// }



// #let question_counter = counter("question_counter")
// #let part_counter = counter("part_counter")
// #let disp_question_counter = false

// #let question(number) = {
//   question_counter.step()

//   // Title bar
//   move(dy: .4em, line(length: 100%))
//   show: text.with(weight: "bold")
//   if disp_question_counter [#question_counter.display("1. ")]
//   number
//   // move(dy: -.4em, line(length: 100%))
// }

// #let part(body) = {
//   part_counter.step()
//   block[#{
//     show: text.with(weight: "bold")
//     show: text.with(weight: "regular")
//     body
//     part_counter.display("(a)")
//   }]
// }

// #let indented(body) = pad(
//   left: .2in,
//   body,
// )


//
// THEOREMS & PROOFS
//
#let mathcounter = rich-counter(
  identifier: "mathblocks",
  inherited_levels: 0
)

#let theorem = mathblock(
  blocktitle: "Theorem",
  counter: mathcounter,
)

#let claim = mathblock(
  blocktitle: "Claim",
  counter: mathcounter,
)

#let lemma = mathblock(
  blocktitle: "Lemma",
  counter: mathcounter,
)

#let definition = mathblock(
  blocktitle: "Definition",
  counter: mathcounter,
)


#let proof = proofblock()


//
// ALERTS
//
#let alert(body) = {
  text(fill: red, size: 5em, weight: 900, body + "\n")
}
#let NOT_DONE = alert[NOT DONE]
#let CHECK_LATER = alert[CHECK LATER]
#let ADD_PIC = alert[ADD PICTURE]

//
// SECTIONING
// 
#let problem(number, pbreak: true) = {
  if pbreak {
    pagebreak(weak: true)
  }
  [= Problem #number]
}

#let part(name) = {
  [== Part (#name)]
}

#let ans(body) = {
  if body == [] {
    NOT_DONE
  } else {
    align(center, rect(stroke: green, inset: 10pt, body))
  }
}

//
// ANNOTATIONS
//  
#let annot = annot.with(pos: top, leader-connect: "elbow")
#let mark = mark.with(color: blue)
#let markhl = markhl.with(color: blue)
#let markrect = markrect.with(color: blue)

//
// INIT ASSIGNMENT
//
#let assignment(author: "", assignment: "", course: "", instructor: "", body) = {
  // 
  // DOC PROPS
  //
  if author == "" {
    author = MY_NAME
  }
  set document(author: author, title: assignment)
  set text(12pt, font: "New Computer Modern", lang: "en")
  show raw: text.with(font: "Iosevka")

  set image(width: 3in)
  show image: it => {
    align(center, it)
  }

  

  set page(
    paper: "us-letter",
    numbering: "1",
    number-align: center + bottom,
    header: {
      grid(
        columns: (1fr, 1fr, 1fr),
        rows: (auto),
        [#set align(left); #course _ #instructor _],
        [#set align(center); #assignment],
        [#set align(right); *#author*],
      )
      v(-.8em)
      line(length: 100%, stroke: .5pt)
    },
    footer: context {
      line(length: 100%, stroke: .5pt)
      v(-.5em)
      [#set align(center); *#str(counter(page).at(here()).first())*]
    },
  )

  //
  // STYLING
  //
  fancy-units-configure(per-mode: "fraction")
  add-macros(
    ..UNITS
  )

  // needed to show proofs not centered
  show: great-theorems-init

  // show math.equation: set block(breakable: true)
  show heading.where(level: 1): set text(size: 1.25em)
  show link: it => underline(text(fill: blue)[#it])  

  // Main body.
  set enum(indent: 1em)
  set par(justify: true)
  body

}