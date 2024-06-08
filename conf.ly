%%% 2023年 2月27日 星期一 11时53分18秒 CST
%%% author: Shao-Dan Lee 李小丹 字 殊恒

#(set-default-paper-size "a4")
%%% \paper can't be in this block?
\layout {
	indent = #0
	line-width = #166
	\context {
		\Score
 		\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
		\override VerticalAxisGroup.default-staff-staff-spacing =
			#'((basic-distance . 8)
			(minimum-distance . 7)
			(padding . 1))
%		\override BarNumber.break-visibility = #end-of-line-invisible
%		barNumberVisibility = #all-bar-numbers-visible
		breathMarkType = #'caesura
		\override Hairpin.to-barline = ##f
	}
}
