// Copyright (c) 2012-2016 K Team. All Rights Reserved.

module MTC-SYNTAX
  import PATTERN-SYNTAX

  syntax MLSorts    ::= ".MLSorts"
                      | MLSort
					  > MLSorts MLSorts [assoc, unit(.MLSort)]
					  
  syntax MLSortDecl ::= "(" "declare-sort" MLSort ")"
  syntax SymbolDecl ::= "(" "declare-symb" Symbol "(" MLSorts ")" MLSort ")"
  syntax FuncDecl   ::= "(" "declare-func" Symbol "(" MLSorts ")" MLSort ")"
  syntax Decl       ::= MLSortDecl | SymbolDecl | FuncDecl

  syntax Assertion  ::= "(" "assert" Pattern ")"
 
  syntax Statement  ::= Decl
                      | Assertion
  
  syntax Statements ::= Statement 
                      > Statements Statements [assoc]

endmodule

module PATTERN-SYNTAX
  syntax MLSort      ::= Id 
  syntax Symbol      ::= Id
  syntax Application ::= Symbol 
                       | "(" Symbol Patterns ")"
  syntax Binder      ::= "(" Id MLSort ")"
  syntax Binders     ::= List{Binder, ""}       [klabel(BinderList)]

  syntax Pattern     ::= "top"
                       | "bot"
                       | Application
                       | "(" "and" Patterns ")"
                       | "(" "or"  Patterns ")"
                       | "(" "->"  Pattern Pattern ")"
                       | "(" "="   Pattern Pattern ")"
                       | "(" "not" Pattern ")"
                       | "(" "contains" Pattern Pattern ")"
                       | "(" "floor" Pattern ")"
                       | "(" "ceil" Pattern ")"
                       | "(" "forall" "(" Binders ")" Pattern ")"
                       | "(" "exists" "(" Binders ")" Pattern ")"
  syntax Patterns    ::= List{Pattern, ""}      [klabel(PatternList)]
endmodule

module MTC
  import MTC-SYNTAX
  
  configuration <T>
                  <k> $PGM:Statements </k>
                  <out> .List </out>
                </T>

//  rule <k> (S:Statement Ss:Statements => Ss) </k>
//       <out> (Ss1:Statements => (convert(S) Ss1)) </out> 

  rule <k> ((declare-sort S:MLSort) Ss:Statements) => Ss </k>
       <out> ... (.List => ListItem((declare-sort S))) </out>
	   
endmodule