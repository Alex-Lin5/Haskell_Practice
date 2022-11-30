ACST Exercise 4.2.2 
In operating systems with discretionary access control, a user can
specify who else can read, write, or execute her files. Suppose Carter creates a
program foo, and he wants Dan to be able to execute foo but neither read foo nor
write to it. Also, Carter wishes to grant read, write, and execute privileges to Jan.
Assume that Dan and Jan have userids dan and jan, respectively. Formalize the
above description and formally justify why Jan’s request to execute foo should be
granted.

Description:
User    userid
Dan     dan
Jan     jan

Carter creates Program foo.
Carter grants Dan execution privilege of Program foo.
Carter grants Jan exe, read, write privileges of Program foo.

Assumption:
Jan execute program foo is valid.

Formalize:
Carter Controls (ex ∨ rd ∨ wt)
Carter says (Dan controls ex)
Carter says (Jan controls (ex ∨ rd ∨ wt))

Carter says (Jan controls (ex ∨ rd ∨ wt))
= Jan controls ex