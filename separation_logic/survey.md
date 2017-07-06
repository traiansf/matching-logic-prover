# A survey of separation logic and its tools

[DPV11] *Predator: A Practical Tool for Checking Manipulation of Dynamic Data Structures Using Separation Logic*
This paper presents a tool called Predator for fully automatic verification of sequential C programs with dynamic linked data structures (various complex kinds of singly-linked as well as doubly-linked lists in particular). Predator has a long-term goal of handling real system code, in particular, the Linux kernel. It is written in C++, built as a gcc plug-in, and open source. It comes with a limited support of pointer arithmetic. 
Along with the tool, a comprehensive set of programs (over a hundred test cases) that can be handled is distributed. Those include various textbook implementations of lists and examples using Linux lists at https://github.com/kdudka/predator/tree/61d5df3/sl/data. Those case studies are mid-size (up to 300 lines) but contain almost only pointer manipulations. What is also provided are examples of various sorting algorithms operating on various dynamic data structures. The tool is not proving the resulting lists are sorted but verifies memory safety of the code, which Invader is not able to do.

[BGKR16] *Model Checking for Symbolic-Heap Separation Logic with Inductive Predicates*
This paper investigates the model checking problem for symbolic-heap separation logic with user-defined inductive predicates. The problem is proved to be decidable and appreciates a bottom-up fixed point algorithm (instead of a top-down one). In general, the problem is EXPTIME-complete, but becomes NP-complete or PTIME-solvable when natural syntactic restrictions on the schemata defining the inductive predicates are assumed. This paper is a hard one. I haven't understood it yet. However, it has a good list of references.

[JSPVPP11] *VeriFast: A Powerful, Sound, Predictable, Fast Verifier for C and Java*

[PMQ14] *Natural Proofs for Data Structure Manipulation in C using Separation Logic*



[???] *Space Invader*

