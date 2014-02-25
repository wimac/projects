" Vim syntax file
" Language: OpenSSH server configuration file (ssh_config)
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2003-05-06
" URL: http://trific.ath.cx/Ftp/vim/syntax/sshconfig.vim

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
syn match sshconfigComment "#.*$" contains=sshconfigTodo
syn keyword sshconfigTodo TODO FIXME NOT contained
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Constants {{{
syn keyword sshconfigYesNo yes no ask
" protocol v1
syn keyword sshconfigCipher blowfish des 3des
" protocol v2
syn keyword sshconfigCipher aes128-cbc 3des-cbc blowfish-cbc cast128-cbc
syn keyword sshconfigCipher arcfour aes192-cbc aes256-cbc
syn keyword sshconfigMAC hmac-md5 hmac-sha1 hmac-ripemd160 hmac-sha1-96
syn keyword sshconfigMAC hmac-md5-96
syn keyword sshconfigHostKeyAlg ssh-rsa ssh-dss
syn keyword sshconfigPreferredAuth hostbased publickey password
syn keyword sshconfigPreferredAuth keyboard-interactive
syn keyword sshconfigLogLevel QUIET FATAL ERROR INFO VERBOSE
syn keyword sshconfigLogLevel DEBUG DEBUG1 DEBUG2 DEBUG3
syn keyword sshconfigSysLogFacility DAEMON USER AUTH LOCAL0 LOCAL1 LOCAL2
syn keyword sshconfigSysLogFacility LOCAL3 LOCAL4 LOCAL5 LOCAL6 LOCAL7
syn match sshconfigSpecial "[*?]"
syn match sshconfigNumber "\d\+"
syn match sshconfigHostPort "\<\(\d\{1,3}\.\)\{3}\d\{1,3}\(:\d\+\)\?\>"
syn match sshconfigHostPort "\<\([-a-zA-Z0-9]\+\.\)\+[-a-zA-Z0-9]\{2,}\(:\d\+\)\?\>"
" FIXME: this matches quite a few things which are NOT valid IPv6 addresses
syn match sshconfigHostPort "\<\(\x\{,4}:\)\+\x\{,4}[:/]\d\+\>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Keywords {{{
syn keyword sshconfigHostSect Host
syn keyword sshconfigKeyword AFSTokenPassing BatchMode BindAddress
syn keyword sshconfigKeyword ChallengeResponseAuthentication CheckHostIP
syn keyword sshconfigKeyword Cipher Ciphers ClearAllForwardings Compression
syn keyword sshconfigKeyword CompressionLevel ConnectionAttempts
syn keyword sshconfigKeyword DynamicForward EscapeChar ForwardAgent ForwardX11
syn keyword sshconfigKeyword GatewayPorts GlobalKnownHostsFile
syn keyword sshconfigKeyword HostbasedAuthentication HostKeyAlgorithms
syn keyword sshconfigKeyword HostKeyAlias HostName IdentityFile KeepAlive
syn keyword sshconfigKeyword KerberosAuthentication KerberosTgtPassing
syn keyword sshconfigKeyword LocalForward LogLevel MACs
syn keyword sshconfigKeyword NoHostAuthenticationForLocalhost
syn keyword sshconfigKeyword NumberOfPasswordPrompts PasswordAuthentication
syn keyword sshconfigKeyword Port PreferredAuthentications Protocol
syn keyword sshconfigKeyword ProxyCommand PubkeyAuthentication RemoteForward
syn keyword sshconfigKeyword RhostsAuthentication RhostsRSAAuthentication
syn keyword sshconfigKeyword RSAAuthentication SmartcardDevice
syn keyword sshconfigKeyword StrictHostKeyChecking UsePrivilegedPort User
syn keyword sshconfigKeyword UserKnownHostsFile XAuthLocation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
" Define the default highlighting {{{
" For version 5.7 and earlier: Only when not done already
" For version 5.8 and later: Only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sshconfig_syntax_inits")
  if version < 508
    let did_sshconfig_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sshconfigComment           Comment
  HiLink sshconfigTodo              Todo
  HiLink sshconfigHostPort          sshconfigConstant
  HiLink sshconfigNumber            sshconfigConstant
  HiLink sshconfigConstant          Constant
  HiLink sshconfigYesNo             sshconfigEnum
  HiLink sshconfigCipher            sshconfigEnum
  HiLink sshconfigMAC               sshconfigEnum
  HiLink sshconfigHostKeyAlg        sshconfigEnum
  HiLink sshconfigLogLevel          sshconfigEnum
  HiLink sshconfigSysLogFacility    sshconfigEnum
  HiLink sshconfigPreferredAuth     sshconfigEnum
  HiLink sshconfigEnum              Function
  HiLink sshconfigSpecial           Special
  HiLink sshconfigKeyword           Keyword
  HiLink sshconfigHostSect          Type
  delcommand HiLink
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
let b:current_syntax = "sshconfig"

