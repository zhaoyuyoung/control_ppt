class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar',
  }
  package {'java':
    ensure => present,
  }
  file {'opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=ture',
  }
  file {'/etc/systemd/system/mindcraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',    
  }
  service {'minecraft':
    ensure => 'running',
    enable => true,
  }
}
