{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "cgroup_no_v1=all"
      "systemd.unified_cgroup_hierarchy=yes"
      "console=tty1"
      "nowatchdog"
      "tsc=reliable"
      "loglevel=3"
      "quiet"
    ];

    kernelModules = [ "tcp_bbr" ];

    kernel.sysctl = {
      # Magic SysRq key, security concern
      "kernel.sysrq" = 0;
      # no bogus errors in losg
      "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
      # reverse path filtering
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.app.rp_filter" = 1;
      # disable unneeded functionality (mostly that of routers)
      "net.ipv4.conf.all.accept_source_route" = 0;
      "net.ipv6.conf.all.accept_source_route" = 0;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      # refuse icmp redirects - mitm mitigation
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      # protect against SYN flood attacks
      "net.ipv4.tcp_syncookies" = 1;
      # RFC 1337 TIME-WAIT assassination
      "net.ipv4.tcp_rfc1337" = 1;

      # optimize TCP
      "net.ipv4.tcp_fastopen" = 3; # enable fast open in & out
      # mitigate bufferbloat = improve latency & throughput
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };

    supportedFilesystems = [ "btrfs" "ntfs" "ext4" ];
  };
}
