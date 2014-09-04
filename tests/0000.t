Behavior with fully explicit base and head
==========================================

setup
*****

::

  $ . $TESTDIR/tools.sh

  $ cd checkout

  $ git config --get mantle.upstream
  [1]

  $ git config --get mantle.public
  [1]

head not found in public
************************

::

  $ git mantle up/master rn/feature
  fatal: bad revision 'rn/feature'
  [1]


base not found in upstream
**************************

::

  $ git push -q rn hack:feature
  $ git mantle up/fubar rn/feature
  fatal: bad revision 'up/fubar'
  [1]


base not an ancestor of head
****************************

::

  $ git mantle rn/feature up/master
  fatal: 'rn/feature..up/master' is an empty range
  [1]

happy path
**********

::

  $ git mantle up/master rn/feature
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

