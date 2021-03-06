" Vim syntax file
" Language: OpenSSH server configuration file (sshd_config)
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2003-05-06
" URL: http://trific.ath.cx/Ftp/vim/syntax/sshdconfig.vim

" Setup {{{
" React to possibly already-defined syntax.
" For version 5.x: Clear all syntax items unconditionally
" For version 6.x: Quit when a syntax file was already loaded
if version >= 600
  if exists("b:current_syntax")
    finish
  endif
else
  syntax clear
endif

if version >= 600
  setlocal iskeyword=_,-,a-z,A-Z,48-57
else
  set iskeyword=_,-,a-z,A-Z,48-57
endif

syn case ignore
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Comments {{{
syn match sshdconfigComment "#.*$" contains=sshdconfigTodo
syn keyword sshdconfigTodo TODO FIXME NOT contained
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Constants {{{
syn keyword sshdconfigYesNo yes no
syn keyword sshdconfigCipher aes128-cbc 3des-cbc blowfish-cbc cast128-cbc
syn keyword sshdconfigCipher aes192-cbc aes256-cbc
syn keyword sshdconfigCipher arcfour
syn keyword sshdconfigMAC hmac-md5 hmac-sha1 hmac-ripemd160 hmac-sha1-96
syn keyword sshdconfigMAC hmac-md5-96
syn keyword sshdconfigRootLogin without-password forced-commands-only
syn keyword sshdconfigLogLevel QUIET FATAL ERROR INFO VERBOSE
syn keyword sshdconfigLogLevel DEBUG DEBUG1 DEBUG2 DEBUG3
syn keyword sshdconfigSysLogFacility DAEMON USER AUTH LOCAL0 LOCAL1 LOCAL2
syn keyword sshdconfigSysLogFacility LOCAL3 LOCAL4 LOCAL5 LOCAL6 LOCAL7
syn match sshdconfigSpecial "[*?]"
syn match sshdconfigNumber "\d\+"
syn match sshdconfigHostPort "\<\(\d\{1,3}\.\)\{3}\d\{1,3}\(:\d\+\)\?\>"
syn match sshdconfigHostPort "\<\([-a-zA-Z0-9]\+\.\)\+[-a-zA-Z0-9]\{2,}\(:\d\+\)\?\>"
" FIXME: this matches quite a few things which are NOT valid IPv6 addresses
syn match sshdconfigHostPort "\<\(\x\{,4}:\)\+\x\{,4}:\d\+\>"
syn match sshdconfigTime "\<\(\d\+[sSmMhHdDwW]\)\+\>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Keywords {{{
syn keyword sshdconfigKeyword AFSTokenPassing AllowGroups AllowTcpForwarding
syn keyword sshdconfigKeyword AllowUsers AuthorizedKeysFile Banner
syn keyword sshdconfigKeyword ChallengeResponseAuthentication Ciphers
syn keyword sshdconfigKeyword ClientAliveInterval ClientAliveCountMax
syn keyword sshdconfigKeyword Compression DenyGroups DenyUsers GatewayPorts
syn keyword sshdconfigKeyword HostbasedAuthentication HostKey IgnoreRhosts
syn keyword sshdconfigKeyword IgnoreUserKnownHosts KeepAlive
syn keyword sshdconfigKeyword KerberosAuthentication KerberosOrLocalPasswd
syn keyword sshdconfigKeyword KerberosTgtPassing KerberosTicketCleanup
syn keyword sshdconfigKeyword KeyRegenerationInterval ListenAddress
syn keyword sshdconfigKeyword LoginGraceTime LogLevel MACs MaxStartups
syn keyword sshdconfigKeyword PAMAuthenticationViaKbdInt
syn keyword sshdconfigKeyword PasswordAuthentication PermitEmptyPasswords
syn keyword sshdconfigKeyword PermitRootLogin PermitUserEnvironment PidFile
syn keyword sshdconfigKeyword Port PrintLastLog PrintMotd Protocol
syn keyword sshdconfigKeyword PubkeyAuthentication RhostsAuthentication
syn keyword sshdconfigKeyword RhostsRSAAuthentication RSAAuthentication
syn keyword sshdconfigKeyword ServerKeyBits StrictModes Subsystem
syn keyword sshdconfigKeyword SyslogFacility UseLogin UsePrivilegeSeparation
syn keyword sshdconfigKeyword VerifyReverseMapping X11DisplayOffset
syn keyword sshdconfigKeyword X11Forwarding X11UseLocalhost XAuthLocation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Define the default highlighting {{{
" For version 5.7 and earlier: Only when not done already
" For version 5.8 and later: Only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sshdconfig_syntax_inits")
  if version < 508
    let did_sshdconfig_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sshdconfigComment           Comment
  HiLink sshdconfigTodo              Todo
  HiLink sshdconfigHostPort          sshdconfigConstant
  HiLink sshdconfigTime              sshdconfigConstant
  HiLink sshdconfigNumber            sshdconfigConstant
  HiLink sshdconfigConstant          Constant
  HiLink sshdconfigYesNo             sshdconfigEnum
  HiLink sshdconfigCipher            sshdconfigEnum
  HiLink sshdconfigMAC               sshdconfigEnum
  HiLink sshdconfigRootLogin         sshdconfigEnum
  HiLink sshdconfigLogLevel          sshdconfigEnum
  HiLink sshdconfigSysLogFacility    sshdconfigEnum
  HiLink sshdconfigEnum              Function
  HiLink sshdconfigSpecial           Special
  HiLink sshdconfigKeyword           Keyword
  delcommand HiLink
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
let b:current_syntax = "sshdconfig"
