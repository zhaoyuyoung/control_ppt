class minecraft {
  $url = 'https://launcher.mojang.com/mc/game/1.12.2/server/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar'
  $install_dir = '/opt/minecraft'
  file {'/opt/minecraft':
    ensure => directory,
  }
  file {'${install_dir}/minecraft_server.jar':
    ensure => file,
    source => $url,
    before => Servie['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=ture',
  }
  file {'/etc/systemd/system/mindcraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',  
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir,
    })
  }
  service {'minecraft':
    ensure => 'running',
    enable => true,
    require => [Package['java'],File['/opt/minecraft/eula.txt'],File['/etc/systemd/system/minecraft.server']],
  }
}
