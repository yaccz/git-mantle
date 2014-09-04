Behavior with implicit `base`
=============================

setup
*****

::

  $ . $TESTDIR/tools.sh

  $ cd checkout
  $ git push -q rn hack:feature


missing configuration
*********************

::

  $ git config --get mantle.upstream
  [1]
  $ git mantle rn/feature
  usage: git-mantle [options] [[base] head]
  [1]


wrong configuration
*******************

::

  $ git config mantle.upstream omg/wtf
  $ git mantle rn/feature
  fatal: bad revision 'omg/wtf'
  [1]


happy path
**********

Summarize the changes from `up/master` to `rn/feature`, offering
them for pull from `remote.rn.url`.

::

  $ git config --local mantle.upstream up/master
  $ git mantle rn/feature
  repo = git@pub.example.org
  head = ab984c9b99ffc420ceea6a8491f952275698d294 rn/feature
  base = 85b915e100b621d1ec7783b6a9b8dc6b09233614 up/master
  
   .gitignore | 1 +
   README     | 2 +-
   2 files changed, 2 insertions(+), 1 deletion(-)
  
  1/2 76a23b86 043603cc README fancier
      162441d0 README
  2/2 87990615 ab984c9b ignore vim swapfiles
      32682119 .gitignore

