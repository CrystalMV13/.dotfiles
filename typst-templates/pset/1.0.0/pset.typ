//
// PACKAGES
// 
// #import "@preview/unify:0.7.1": *
#import "@preview/physica:0.9.5": *
#import "@preview/fancy-units:0.1.0": fancy-units-configure, num, unit, qty
#import "@preview/mannot:0.2.2": markrect

#let MY_NAME = "Crystal McArdle-Ventura"


#let Ohm = sym.Omega


//
// ALERTS
//
#let alert(body) = {
  text(fill: red, size: 10em, body)
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
// SHORTCUTS
// 
#let bound(expression, lo, hi) = {
  $lr(#expression|)_#lo^#hi$
}
#let eval(expression, evaluateat) = {
  $lr(#expression|)_#evaluateat$
}
#let int = sym.integral

#let da = $dif a$
#let db = $dif b$
#let dc = $dif c$
#let dd = $dif d$
#let de = $dif e$
#let df = $dif f$
#let dg = $dif g$
#let dh = $dif h$
#let di = $dif i$
#let dj = $dif j$
#let dk = $dif k$
#let dl = $dif l$
#let dm = $dif m$
#let dn = $dif n$
#let do = $dif o$
#let dp = $dif p$
#let dq = $dif q$
#let dr = $dif r$
#let ds = $dif s$
#let dt = $dif t$
#let du = $dif u$
#let dv = $dif v$
#let dw = $dif w$
#let dx = $dif x$
#let dy = $dif y$
#let dz = $dif z$

#let dA = $dif A$
#let dB = $dif B$
#let dC = $dif C$
#let dD = $dif D$
#let dE = $dif E$
#let dF = $dif F$
#let dG = $dif G$
#let dH = $dif H$
#let dI = $dif I$
#let dJ = $dif J$
#let dK = $dif K$
#let dL = $dif L$
#let dM = $dif M$
#let dN = $dif N$
#let dO = $dif O$
#let dP = $dif P$
#let dQ = $dif Q$
#let dR = $dif R$
#let dS = $dif S$
#let dT = $dif T$
#let dU = $dif U$
#let dV = $dif V$
#let dW = $dif W$
#let dX = $dif X$
#let dY = $dif Y$
#let dZ = $dif Z$

#let dtheta = $dif theta$
#let dphi = $dif phi$
#let dpsi = $dif psi$

#let vv(var) = $bold(upright(arrow(var)))$
#let uv(var) = $bold(upright(hat(var)))$

#let ddot(var) = $dot.double(var)$

#let mag(var) = $lr(||var||)$

//
// Functions
//





//
// Astro stuff
//
#let Sun = "⊙"


//
// Linear algebra stuff
// 
#let span = "span"


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

  show math.equation: set block(breakable: true)

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
  show heading.where(level: 1): set text(size: 1.25em)
  
  // Main body.
  set par(justify: true)
  body
}