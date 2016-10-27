# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
Version control allows different versions of a given codebase to be worked on independently.  This allows multiple people to colaborate on pieces of code effectively, or simply allows the master copy to keep on keepin' on while someone fiddles with adding a new feature, merging the changes when complete.

* What is a branch and why would you use one?
A branch is a 'copy' or 'version' of a codebase.  It can be independently edited, committed, or deleted, without affecting the master code.

* What is a commit? What makes a good commit message?
A commit is essentially a save point.  A good commit message is clear, concise, and meaningful.

* What is a merge conflict?
A merge conflict arises when two branches are trying to merge with conflicting changes.  Example with the Octopus file from an earlier lesson - if the name of the octopus was changed on both the master and 'name' branch since the last joint commit, a merge would lead to an error because the program doesn't know which change is meant to take precidence.