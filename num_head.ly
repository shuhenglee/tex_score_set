%%% 2023年 2月20日 星期一 15时48分14秒 CST
%% from manual

#(define Ez_numbers_engraver (make-engraver
			       (acknowledgers
				 ((note-head-interface engraver grob source-engraver)
				  (let* ((context (ly:translator-context engraver)) (tonic-pitch (ly:context-property context 'tonic)) (tonic-name (ly:pitch-notename tonic-pitch))
				(grob-pitch (ly:event-property (event-cause grob) 'pitch)) (grob-name (ly:pitch-notename grob-pitch)) (delta (modulo (- grob-name tonic-name) 7)) (note-names
				(make-vector 7 (number->string (1+ delta))))) (ly:grob-set-property! grob 'note-names note-names))))))
% #(set-global-staff-size 26)
%\page {
%	page-width = 50\mm
%}
\layout {
	indent = #0
%	line-width = #5\cm
	ragged-last = ##t
	\context {%
%	#(layout-set-staff-size 26)
		\Voice
		\consists \Ez_numbers_engraver
% 		\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)

	}
}
