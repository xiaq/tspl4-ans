; * Quoted expressions evaluate to themselves.
;
; * Unquoted symbols apply to the values they are bound to.
;
; * Unquoted lists evaluate by first evaluating each term recursively, and
;   using the first term as a procedure and applying it to the rest of the
;   terms.
