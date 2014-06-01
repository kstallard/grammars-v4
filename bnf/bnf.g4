/*
 [The "BSD licence"]
 Copyright (c) 2013 Tom Everett
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/*
* Based on ABNF grammar by Rainer Schuster
*/

grammar bnf;

rulelist
    : rule_* EOF
;

rule_
    : lhs '::=' rhs
    ;

lhs
    : id
    ;

rhs
    : element+
    ;

element
    : id
    | atom
    | optional
    | zeroormore
    | oneormore
    | alternative
    ;

optional
    : '[' element ']'
    ;

zeroormore
    : '{' element '}'
    | element '*'
    ;

oneormore
     : '(' element ')'
    | element '+'
    ;

alternative
    : element '|' element
    ;

atom
    : ATOM
    ;

id
    : ID
    ;

ATOM
    : ('a'..'z'|'A'..'Z' | ';' | ',')+
    ;

ID
    : '<' ('a'..'z'|'A'..'Z') ('a'..'z'|'A'..'Z'|'0'..'9')* '>'
    ;

WS
    : [ \t\r\n] -> skip
    ;
