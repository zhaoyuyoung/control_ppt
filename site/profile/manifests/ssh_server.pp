class profile::ssh_server {
  package {'openssh-server':
          ensure => present,
  }
  service { 'sshd':
          ensure => 'running',
          enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
          ensure => present,
          user   => 'root',
          type   => 'ssh-rsa',
          key    => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDexmCjfixgcWbr3FDAnXBUo90jvXgtuAkcsKYMPlk2JnrKjKTNAhQD9RvQxoSnhHyKUFPtZ3BO0oqArpaaeuBB1iqWJZRlJjMGMglkfK/ZGyNKPzDin8qxilW0I6zmxMW+38t0THCZpdhz62FakIYevhYPNMAGflga7N4nIbv9//BRe1SC6x55Zj8NH8QIBN94M18UtfFhuUYOyEPs2s+Eo+WSXtBx4IbX97J3pZOScSkOoPhjWzfS86oNwQO5Sgy1dzlLEp3MJRURfiM/ojtT6KJsD/8ygdAMJMqAEt9dzUjd/IShLRM1bzZ7AfqLzL/51T96Cma3Zpdh7thWYyU9',
}
