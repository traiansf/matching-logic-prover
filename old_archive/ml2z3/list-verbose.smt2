(declare-sort MLBol)  
(declare-sort MLNat)  
(declare-sort MLSeq)  
(declare-sort MLMap)  

(declare-fun zero ( MLNat) Bool) 
(declare-fun succ (MLNat MLNat) Bool) 
(declare-fun plus (MLNat MLNat MLNat) Bool) 

(assert (forall (($ MLNat)) 
        (forall ((M MLNat)) 
        (forall (($19 MLNat)) 
          (= (exists (($21 MLNat)) 
             (exists (($22 MLNat)) 
               (and (and (plus $21 $22 $19) 
                         (zero $21)) 
                         (= $22 M)))) 
             (= $19 M))))))

(assert (forall (($ MLNat)) 
        (forall ((M MLNat)) 
        (forall ((N MLNat)) 
        (forall (($20 MLNat)) 
        (= (exists (($23 MLNat)) 
           (exists (($24 MLNat)) 
           (and (and (plus $23 $24 $20) 
                     (exists (($28 MLNat)) (and (succ $28 $23) (= $28 M)))) 
                     (= $24 N)))) 
           (exists (($25 MLNat)) 
           (and (succ $25 $20) 
                (exists (($26 MLNat)) 
                (exists (($27 MLNat)) 
                (and (and (plus $26 $27 $25) 
                          (= $27 N)) 
                          (= $26 M))))))))))))

(assert (exists (($7 MLNat)) (zero $7))) 

(assert (forall (($7 MLNat)) 
        (forall (($8 MLNat)) 
        (=> (and (zero $8) (zero $7)) (= $7 $8))))) 

(assert (forall (($11 MLNat)) 
        (exists (($12 MLNat)) 
        (succ $11 $12)))) 

(assert (forall (($11 MLNat)) 
        (forall (($12 MLNat)) 
        (forall (($13 MLNat)) 
        (=> (and (succ $11 $13) (succ $11 $12)) 
            (= $12 $13)))))) 

(assert (forall (($14 MLNat)) 
        (forall (($15 MLNat)) 
        (exists (($9 MLNat)) (plus $14 $15 $9))))) 

(assert (forall (($14 MLNat)) 
        (forall (($15 MLNat)) 
        (forall (($9 MLNat)) 
        (forall (($10 MLNat)) 
        (=> (and (plus $14 $15 $9) (plus $14 $15 $10)) 
            (= $9 $10))))))) 

(assert (forall (($1 MLNat)) 
        (forall (($2 MLNat)) 
        (forall (($0 MLNat)) 
        (= (plus $1 $2 $0) (plus $2 $1 $0)))))) 

(assert (not 
  (forall (($ MLNat)) 
  (forall (($3 MLNat)) 
  (= (exists (($4 MLNat)) 
     (exists (($5 MLNat)) 
     (and (and (plus $4 $5 $3) 
               (exists (($18 MLNat)) (and (succ $18 $5) (zero $18)))) 
               (exists (($17 MLNat)) (and (succ $17 $4) (zero $17)))))) 
     (exists (($6 MLNat))
     (and (succ $6 $3) 
          (exists (($16 MLNat)) 
          (and (succ $16 $6) (zero $16)))))))))) 

(check-sat)
