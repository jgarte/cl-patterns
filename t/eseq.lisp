(in-package #:cl-patterns/tests)

(in-suite cl-patterns-tests)

(test eseq
  "Test basic eseq functionality"
  (is (= 2
         (eseq-length (eseq (list (event :foo 1) (event :foo 2)))))
      "eseq-length does not return correct results")
  (is (apply #'<= (gete (eseq-events (eseq (list
                                            (event :beat 0)
                                            (event :beat 1)
                                            (event :beat 2)
                                            (event :beat 3)))) :beat))
      "eseq does not keep its events in order by beat"))

(test bsubseq-eseq
  "Test the bsubseq function on eseqs"
  (is-true
   (every-event-equal
    (list
     (event :beat 1))
    (bsubseq (eseq (list
                    (event :beat 0)
                    (event :beat 1)
                    (event :beat 2)
                    (event :beat 3)))
             1 2))
   "every-event-equal doesn't select the correct event")
  (is-true
   (every-event-equal
    (list
     (event :beat 1)
     (event :beat 2))
    (bsubseq (eseq (list
                    (event :beat 0)
                    (event :beat 1)
                    (event :beat 2)
                    (event :beat 3)))
             1 3))
   "every-event-equal doesn't select the correct events"))
