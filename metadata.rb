name             'dovecot'
maintainer       'Onddo Labs, Sl.'
maintainer_email 'team@onddo.com'
license          'Apache 2.0'
description      'Installs/Configures dovecot'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'centos', '>= 6.0'
supports 'debian', '>= 7.0'
supports 'ubuntu', '>= 12.04'

attribute 'dovecot/user',
  :display_name => 'dovecot user',
  :description => 'Dovector system user. Should no be changed',
  :type => 'string',
  :required => 'optional',
  :default => 'dovecot'

attribute 'dovecot/group',
  :display_name => 'dovecot group',
  :description => 'Dovector system group. Should no be changed',
  :type => 'string',
  :required => 'optional',
  :default => 'dovecot'

attribute 'dovecot/lib_path',
  :display_name => 'dovecot library path',
  :description => 'Dovector library path. Should no be changed',
  :calculated => true,
  :type => 'string',
  :required => 'optional'

attribute 'dovecot/conf_path',
  :display_name => 'dovecot configuration path',
  :description => 'Dovector configruration files path. Should no be changed',
  :type => 'string',
  :required => 'optional',
  :default => '/etc/dovecot'

attribute 'dovecot/conf_files_user',
  :display_name => 'dovecot configuration files user',
  :description => 'System user owner of configuration files',
  :type => 'string',
  :required => 'optional',
  :default => 'root'

attribute 'dovecot/conf_files_group',
  :display_name => 'dovecot configuration files group',
  :description => 'System group owner of configuration files',
  :type => 'string',
  :required => 'optional',
  :default => 'node["dovecot"]["group"]'

attribute 'dovecot/conf_files_mode',
  :display_name => 'dovecot configuration files mode',
  :description => 'Configuration files system file mode bits',
  :type => 'string',
  :required => 'optional',
  :default => '00644'

attribute 'dovecot/conf_files/core',
  :display_name => 'dovecot core configuration files',
  :description => 'Dovecot core configuration files list',
  :type => 'array',
  :required => 'optional',
  :default => [
    'conf.d/10-auth.conf',
    'conf.d/10-director.conf',
    'conf.d/10-logging.conf',
    'conf.d/10-mail.conf',
    'conf.d/10-master.conf',
    'conf.d/10-ssl.conf',
    'conf.d/10-tcpwrapper.conf',
    'conf.d/15-lda.conf',
    'conf.d/15-mailboxes.conf',
    'conf.d/90-acl.conf',
    'conf.d/90-plugin.conf',
    'conf.d/90-quota.conf',
    'conf.d/auth-checkpassword.conf.ext',
    'conf.d/auth-deny.conf.ext',
    'conf.d/auth-master.conf.ext',
    'conf.d/auth-passwdfile.conf.ext',
    'conf.d/auth-sql.conf.ext',
    'conf.d/auth-static.conf.ext',
    'conf.d/auth-system.conf.ext',
    'conf.d/auth-vpopmail.conf.ext',
    'dovecot.conf',
    'dovecot-db.conf.ext',
    'dovecot-dict-sql.conf.ext',
    'dovecot-sql.conf.ext',
  ]

attribute 'dovecot/conf_files/imap',
  :display_name => 'dovecot imap configuration files',
  :description => 'Dovecot IMAP configuration files list',
  :type => 'array',
  :required => 'optional',
  :default => [
    'conf.d/20-imap.conf',
  ]

attribute 'dovecot/conf_files/pop3',
  :display_name => 'dovecot pop3 configuration files',
  :description => 'Dovecot POP3 configuration files list',
  :type => 'array',
  :required => 'optional',
  :default => [
    'conf.d/20-pop3.conf',
  ]

attribute 'dovecot/conf_files/lmtp',
  :display_name => 'dovecot lmtp configuration files',
  :description => 'Dovecot LMTP configuration files list',
  :type => 'array',
  :required => 'optional',
  :default => [
    'conf.d/20-lmtp.conf',
  ]

attribute 'dovecot/conf_files/sieve',
  :display_name => 'dovecot sieve configuration files',
  :description => 'Dovecot Sieve configuration files list',
  :type => 'array',
  :required => 'optional',
  :default => [
    'conf.d/20-managesieve.conf',
    'conf.d/90-sieve.conf',
  ]

attribute 'dovecot/conf_files/ldap',
  :display_name => 'dovecot ldap configuration files',
  :description => 'Dovecot LDAP configuration files list',
  :type => 'array',
  :required => 'optional',
  :default => [
    'dovecot-ldap.conf.ext',
    'conf.d/auth-ldap.conf.ext',
  ]

attribute 'dovecot/auth',
  :display_name => 'dovecot auth',
  :description => 'Dovecot Authentication Databases as a hash of hashes. Supported authdbs: checkpassword, deny, ldap, master, passwdfile, sql, system and vpopmail',
  :type => 'string',
  :required => 'optional',
  :default => '{}'

attribute 'dovecot/namespaces',
  :display_name => 'dovecot namespaces',
  :description => 'Dovecot Namespaces as an array of hashes',
  :type => 'array',
  :required => 'optional',
  :default => []

attribute 'dovecot/plugins',
  :display_name => 'dovecot plugins',
  :description => 'Dovecot Plugins configuration as a hash of hashes. Supported plugins: mail_log, acl and quota',
  :type => 'string',
  :required => 'optional',
  :default => '{
    "sieve" => {
      "sieve" => "~/.dovecot.sieve",
      "sieve_dir" => "~/sieve",
    }
  }'

attribute 'dovecot/protocolos',
  :display_name => 'dovecot protocols',
  :description => 'Dovecot Protocols configuration as a hash of hashes. Supported protocols: lda, imap, lmtp, sieve and pop3',
  :type => 'string',
  :required => 'optional',
  :default => '{}'

attribute 'dovecot/services',
  :display_name => 'dovecot services',
  :description => 'Dovecot Services configuration as a hash of hashes. Supported services: director, imap-login, pop3-login, lmtp, imap, pop3, auth, auth-worker, dict, tcpwrap, managesieve-login and managesieve',
  :type => 'string',
  :required => 'optional',
  :default => '{}'

grouping 'dovecot/conf',
 :title => 'dovecot conf',
 :description => 'Dovecot configuration values'

attribute 'dovecot/conf/mail_plugins',
  :display_name => 'dovecot mail plugins',
  :description => 'Dovecot default enabled mail_plugins',
  :type => 'array',
  :required => 'optional',
  :default => []

#
# dovecot.conf
#

attribute 'dovecot/conf/listen',
  :display_name => 'listen',
  :description => 'A comma separated list of IPs or hosts where to listen in for connections.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/base_dir',
  :display_name => 'dovecot base dir',
  :description => 'Base directory where to store runtime data.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/instance_name',
  :display_name => 'instance name',
  :description => 'Name of this instance. Used to prefix all Dovecot processes in ps output.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/login_greeting',
  :display_name => 'login greeting',
  :description => 'Greeting message for clients.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/login_trusted_networks',
  :display_name => 'login trusted networks',
  :description => 'Space separated list of trusted network ranges.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/login_access_sockets',
  :display_name => 'login access sockets',
  :description => 'Space separated list of login access check sockets.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/verbose_proctitle',
  :display_name => 'verbose proctitle',
  :description => 'Show more verbose process titles (in ps).',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/shutdown_clients',
  :display_name => 'shutdown clients',
  :description => 'Should all processes be killed when Dovecot master process shuts down.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/doveadm_worker_count',
  :display_name => 'doveadm worker count',
  :description => 'If non-zero, run mail commands via this many connections to doveadm server.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/doveadm_socket_path',
  :display_name => 'doveadm socket path',
  :description => 'UNIX socket or host:port used for connecting to doveadm server.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/import_environment',
  :display_name => 'import environment',
  :description => 'Space separated list of environment variables that are preserved on Dovecot startup and his childs.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

attribute 'dovecot/conf/dict',
  :display_name => 'dict',
  :description => 'Dictionary server settings as a hash.',
  :type => 'string',
  :required => 'optional',
  :default => 'nil'

