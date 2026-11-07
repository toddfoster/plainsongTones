\version "2.24.4"
\include "gregorian.ly"
\layout { ragged-right = ##t  }
\paper {
  #(set-paper-size '(cons (* 8.5	 in) (* 11 in)))
}

headLine = {
  \once \override NoteHead.stencil = #ly:text-interface::print
  \once \hide Stem
  \once \override NoteHead.text = \markup { \lower #0.5
    \filled-box #'(0 . 2) #'(0 . 1) #0 } %% adjust x distance of 6 as necessary
}

%% Source: https://wiki.lilypond.community/wiki/Aligning_columns_from_different_markups
#(define-markup-command (columns layout props args) (markup-list?)
   (let ((line-width (/ (chain-assoc-get 'line-width props
                         (ly:output-def-lookup layout 'line-width))
                        (max (length args) 1))))
     (interpret-markup layout props
       (make-line-markup (map (lambda (line)
                                (markup #:pad-to-box `(0 . ,line-width) '(0 . 10)
                                  #:override `(line-width . ,line-width)
                                  line))
                               args)))))

\header {
  title = "Plainsong Chant Tones"
  composer = "Following James Litton's Plainsong Psalter"
  tagline = \markup {
    Engraved by TEF at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

\markup \columns {
\column {
      
\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
      \textMark "Tone I"
      f \[ g \pes a \] \headLine a bes\accentus \[ \cavum a \] a g\accentus  \[ \cavum a \]  \augmentum a
      \divisioMaxima
      \textMark "I.1"
      \headLine a g f \[ g \pes a\accentus \] \[ \cavum g \] \augmentum g
      \finalis
      
      \textMark "I.2"
      \headLine a g f \[ g \pes a\accentus \] \[ \cavum g \] \[ \augmentum { g \pes f } \]
      \finalis
    }
  >>
}
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
      
      \textMark "I.3"
      \headLine a g f g\accentus \[ \cavum g \] \[ g \pes a \flexa \augmentum g \] 
      \finalis
      
      \textMark "I.4"
      \headLine a g f g\accentus \[ \cavum a \] \augmentum a 
      \finalis
      
    }
  >>
}
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
      
      \textMark "I.7"
      \headLine a g f \[ g \pes a\accentus \] \[ \cavum g \] \[ g f e \augmentum { d } \]
      \finalis
      
      \textMark "I.8"
      \headLine a g f \[ g\accentus \pes f \] 
      \once \hide NoteHead f 
      \[ \cavum d \] \augmentum d
      \finalis
    }
  >>
}
" "
" "
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do1"
      \textMark "Tone II"
      \relative { c' d f \headLine f g\accentus \[ \cavum f \] \augmentum f }
      \divisioMaxima
      
      \textMark "II.1"
      \relative { \headLine f' e c\accentus \[ \cavum d \] \augmentum d }
      \finalis
      
      \textMark "II.2"
      \relative { \headLine f' \[ e \pes d \] 
                  \once \hide NoteHead f 
                  \[ f \pes e \] 
                  \once \hide NoteHead f 
                  c\accentus \[ \cavum d \] \augmentum d }
      \finalis
    }
  >>
}
" "
" "
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do2"
      \textMark "Tone III"
      \relative { g \[ a \pes c \] \headLine c d\accentus \[ \cavum c \] c \[ \cavum c \]
                  \[ b\accentus \pes a \] \once \hide NoteHead f \augmentum c' }
      \divisioMaxima
      
      \textMark "III.4"
      \relative { \headLine c' a c\accentus \[ \cavum c \] \augmentum b }
      \finalis
      
      \textMark "III.5"
      \relative { \headLine c' a c\accentus \[ \cavum c \] \[ \augmentum { c \pes b } \] s8 }
      \finalis 
    }
  >>
}
" "
" "
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
      \textMark "Tone IV"
      \relative { a \[ g \pes a \] \headLine a g a b\accentus \[ \cavum a \] \augmentum a }
      \divisioMaxima
      
      \textMark "IV.1"
      \relative { \headLine a g a \[ b \pes a \] \once \hide NoteHead f
                  \[ \cavum g\accentus \] { \[ g\accentus \pes f \] } 
                  \once \hide NoteHead f 
                  \augmentum e }
      \finalis
      
      \textMark "IV.2"
      \relative { \headLine a g a b g\accentus \[ \cavum g \] \augmentum a }
      \finalis 
    }
  >>
}
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
          
      \textMark "IV.4"
      \relative { \headLine a g a b g\accentus \[ \cavum e \] \augmentum e }
      \finalis
            
      \textMark "IV.5"
      \relative { \headLine a g a b g\accentus \[ \cavum e \] \[ \augmentum { e \pes g } \] }
      \finalis
      
      \textMark "IV.6"
      \relative { \headLine a a\accentus \[ \cavum g \] \augmentum g }
      \finalis
    }
  >>
}
}

% Uncomment to push second column to edge of page for double-sided printing
% \column { }


\column {
\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do2"
      \textMark "Tone V"
      \relative { f a c \headLine c d\accentus \[ \cavum c \] \augmentum c }
      \divisioMaxima
      
      \textMark "V.1"
      \relative { \headLine c' d\accentus \[ \cavum b \] b c\accentus \[ \cavum a \] \augmentum a }
      \finalis
      
      \textMark "V.3"
      \relative { \headLine c' a\accentus bes g\accentus \[ \cavum f \] \augmentum f }
      \finalis \break
    }
  >>
}
" "
" "
" "


\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do2"
      \textMark "Tone VI"
      \relative { f \[ g \pes a \] \headLine a g a\accentus \[ \cavum f \] \augmentum f } 
      \divisioMaxima
      \relative { \headLine a f  \[ g \pes a \] g\accentus \[ \cavum f \] \augmentum f}
      \finalis 
    }
  >>
}
" "
" "
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do1"
      \textMark "Tone VII"
      \relative { \[ c' \pes b \] 
                  \once \hide NoteHead b 
                  \[ c \pes d \] \headLine d f\accentus \[ \cavum e \] e d\accentus \[ \cavum e \] \augmentum e }
      \divisioMaxima
      
      \textMark "VII.1"
      \relative { \headLine d' e\accentus \[ \cavum d \] d c\accentus \[ \cavum c \] \[ \augmentum { b \pes a } \] }
      \finalis
      
      \textMark "VII.3"
      \relative { \headLine d' e\accentus \[ \cavum d \] d c\accentus \[ \cavum c \] \augmentum b }
      \finalis 
    }
  >>
}
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
          
      \textMark "VII.6"
      \relative { \headLine d' e\accentus \[ \cavum d \] d c\accentus \[ \cavum c \] \[ \augmentum { d \pes c } \] }
      \finalis

      \textMark "VII.7"
      \relative { \headLine d' e\accentus \[ \cavum d \] d c\accentus \[ \cavum c \] \augmentum d }
      \finalis
    }
  >>
}
" "
" "
" "


\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do2"
      \textMark "Tone"
      \relative { g a c \headLine c d\accentus \[ \cavum c \] \augmentum c }
      \divisioMaxima
      
      \textMark "VIII.1"
      \relative { \headLine c' b c a\accentus \[ \cavum g \] \augmentum g }
      \finalis
      
      \textMark "VIII.2"
      \relative { \headLine c' a c d\accentus \[ \cavum c \] \augmentum c }
      \finalis 
    }
  >>
}
" "

\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
          
      \textMark "VIII.3"
      \relative { \headLine c' b a c\accentus \[ \cavum c \] \augmentum c }
      \finalis 
      
      \textMark "VIII.4"
      \relative { \headLine c' b c a\accentus \[ \cavum g \] \[ g \pes a \flexa \augmentum g \] }
      \finalis 
      
      \textMark "VIII.5"
      \relative { \headLine c' b c a\accentus \[ \cavum g \] \[ \augmentum { g \pes a } \] }
      \finalis 
    }
  >>
}
" "
" "
" "


\score {
  <<
    \new VaticanaVoice = "cantus" {
      \clef "vaticana-do3"
      \textMark "Tonus Peregrinus"
      \relative { a bes \headLine a g bes a g\accentus \[ \cavum f \] \augmentum f }
      \divisioMaxima
      
      \relative { \headLine g d f\accentus \[ \cavum f \] \[ \augmentum { e \pes d } \] }
      \finalis 
    }
  >>
}
}}