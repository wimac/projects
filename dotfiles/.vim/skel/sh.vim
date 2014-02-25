""Shell Scripting settings
au BufWritePost * if getline(1)=~"^#!/bin/[a-z]*sh" | silent !chmod a+x <afile> |endif
