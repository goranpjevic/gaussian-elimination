#!/usr/bin/env dyalogscript

⎕fr←1287
⎕pp←34

⍝ gaussian elimination
ge←{
  p n←⍵
  k←(⊃⍋~(⍸0∘=))|⊃↓⍉n
  r←↑(⊂k⌷n),{(⊃⍵)∘{⍵-⍺×(⊃⍵)÷⊃⍺}¨1↓⍵}↓(k-1)⊖n
  (p,⊂1⌷r)(⍉1↓⍉1↓r)
}

⍝ solve linear equations
le←{
  a←⌽↑⌽¨⍵
  g←1⌷⊖⍉a
  v←⍉¯1↓⍉a
  x←(≢⍉v)⍴1
  ⊃({
    x i←⍵
    s←x×i⊃⌽↓v
    num←(i⊃⌽g)-+/⌽(i-1)↑⌽s
    den←⊃(i-1)↓⌽s
    x←⌽((num÷den)@i)⌽x
    x(i+1)
  }⍣(≢⍉v))x 1
}

a←2⎕nq#'getcommandlineargs'
m←↑' '(⍎¨≠⊆⊢)¨1↓⊃⎕nget(2⊃a)1
⎕←le(⊃ge⍣(≢m))⍬m
