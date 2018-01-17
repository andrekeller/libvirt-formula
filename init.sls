libvirt:
  pkg.installed:
    - pkgs:
      - libvirt
      - qemu
      - openbsd-netcat
      - openvswitch
  service.running:
    - name: libvirtd
    - enable: True

/etc/bash.bashrc.d/libvirt.bash:
  file.managed:
    - source: salt://libvirt/files/libvirt.bash
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/bash.bashrc.d

/etc/libvirt/libvirtd.conf:
  file.managed:
    - source: salt://libvirt/files/libvirtd.conf
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: libvirt

/etc/systemd/system/libvirtd.socket:
  file.managed:
    - source: salt://libvirt/files/libvirtd.socket
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: libvirt
