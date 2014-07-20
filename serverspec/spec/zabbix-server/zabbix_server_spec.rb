require 'spec_helper'

describe package('zabbix') do
  it { should be_installed }
end

describe package('zabbix-server') do
  it { should be_installed }
end

describe service('zabbix-server') do
  it { should be_enabled   }
  it { should be_running   }
end

describe package('zabbix-server-mysql') do
  it { should be_installed }
end

describe package('ntp') do
  it { should be_installed }
end

describe service('ntpd') do
  it { should be_enabled   }
  it { should be_running   }
end

describe package('mysql-server') do
  it { should be_installed }
end

describe service('mysqld') do
  it { should be_enabled   }
  it { should be_running   }
end

describe file('/etc/my.cnf') do
  it { should be_file }
  it { should contain "default-character-set=utf8" }
  it { should contain "skip-character-set-client-handshake" }
  it { should contain "innodb_file_per_table" }
  it { should contain "innodb_buffer_pool_soze=64M" }
  it { should contain "innodb_log_file_size=16M" }
  it { should contain "innodb_log_files_in_group=2" }
end

describe file('/etc/zabbix/zabbix_server.conf') do
  it { should be_file }
  it { should contain "DBName=zabbix" }
  it { should contain "DBUser=zabbix" }
  it { should contain "DBPassword=zabbixpassword" }
  it { should contain "DBSocket=/var/lib/mysql/mysql.sock" }
end

