require 'spec_helper'

describe package('mysql-server') do
  it { should be_installed }
end


describe package('zabbix-server-mysql') do
  it { should be_installed }
  it { should be_installed.with_version("2.2.4") }
end

describe package('zabbix-server') do
  it { should be_installed }
  it { should be_installed.with_version("2.2.4") }
end

describe package('zabbix') do
  it { should be_installed }
  it { should be_installed.with_version("2.2.4") }
end


describe package('zabbix-web-mysql') do
  it { should be_installed }
  it { should be_installed.with_version("2.2.4") }
end

describe package('zabbix-web-japanese') do
  it { should be_installed }
  it { should be_installed.with_version("2.2.4") }
end

describe package('zabbix-web') do
  it { should be_installed }
  it { should be_installed.with_version("2.2.4") }
end


describe package('ntp') do
  it { should be_installed }
end

describe service('ntpd') do
  it { should be_enabled  }
  it { should be_running  }
end


describe file('/etc/my.cnf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'mysql' }
  it { should be_grouped_into 'mysql' }
  it { should contain "default-character-set=utf8" }
  it { should contain "skip-character-set-client-handshake" }
  it { should contain "innodb_file_per_table" }
  it { should contain "innodb_buffer_pool_soze=64M" }
  it { should contain "innodb_log_file_size=16M" }
  it { should contain "innodb_log_files_in_group=2" }
end

describe service('mysqld') do
  it { should be_enabled  }
  it { should be_running  }
end


describe file('/etc/zabbix/zabbix_server.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should contain "DBName=zabbix" }
  it { should contain "DBUser=zabbix" }
  it { should contain "DBPassword=zabbixpassword" }
  it { should contain "DBSocket=/var/lib/mysql/mysql.sock" }
end

describe service('zabbix-server') do
  it { should be_enabled  }
  it { should be_running  }
end

describe file('/etc/zabbix/web/zabbix.conf.php') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'apache' }
  it { should be_grouped_into 'apache' }
  it { should contain "zabbix chan" }
end

describe file('/etc/httpd/conf.d/zabbix.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should contain "php_value date.timezone Asia/Tokyo" }
end

describe service('httpd') do
  it { should be_enabled  }
  it { should be_running  }
end
