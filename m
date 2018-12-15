From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re:  Re: [PATCH 0/8] adding multiple CPU-Ports
Date: Sat, 15 Dec 2018 18:43:24 +0100
Message-ID: <trinity-c0256564-ef09-46dd-8770-d7eff7218e2e-1544895804037@3c-app-gmx-bs07>
References: <20181214164847.4851-1-frank-w@public-files.de>
 <3d53d8cf-3130-17bd-8418-310dda7d93a2@gmail.com>
 <trinity-d5689ac9-d645-48e5-bed9-8a51826f9c50-1544809703712@3c-app-gmx-bs32>
 <0d78bf87-8f91-6936-6366-5900f9070383@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0d78bf87-8f91-6936-6366-5900f9070383@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org, vivien.didelot@gmail.com
List-Id: linux-mediatek@lists.infradead.org

Hi,

have tested only my dsa-Patches (no ethernet-changes), and what should i say...it seems to work well. second gmac is recognized, i can have traffic on both and iperf works...without any crash (tried 5 port changes with iperf between). 

root@bpi-r2:~# ip a                                                                                                                             
...                                                                                                 
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 0a:83:39:52:bd:d3 brd ff:ff:ff:ff:ff:ff
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 92:97:25:d5:ee:2e brd ff:ff:ff:ff:ff:ff
4: wan@eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 92:97:25:d5:ee:2e brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.11/24 brd 192.168.0.255 scope global wan
       valid_lft forever preferred_lft forever
5: lan0@eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 0a:83:39:52:bd:d3 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.19/24 scope global lan0
       valid_lft forever preferred_lft forever
6: lan1@eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 0a:83:39:52:bd:d3 brd ff:ff:ff:ff:ff:ff
7: lan2@eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 0a:83:39:52:bd:d3 brd ff:ff:ff:ff:ff:ff
8: lan3@eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 0a:83:39:52:bd:d3 brd ff:ff:ff:ff:ff:ff
root@bpi-r2:~# iperf -c 192.168.0.21                                                                                                            
------------------------------------------------------------                                                                                    
Client connecting to 192.168.0.21, TCP port 5001                                                                                                
TCP window size: 43.8 KByte (default)                                                                                                           
------------------------------------------------------------                                                                                    
[  3] local 192.168.0.19 port 50214 connected with 192.168.0.21 port 5001                                                                       
[ ID] Interval       Transfer     Bandwidth                                                                                                     
[  3]  0.0-10.0 sec  1.10 GBytes   942 Mbits/sec                                                                                                
root@bpi-r2:~# ip link set lan0 down                                                                                                            
[ 2315.268071] mt7530 mdio-bus:00 lan0: Link is Down                                                                                            
root@bpi-r2:~# ip link set wan up                                                                                                               
[ 2320.668174] mt7530 mdio-bus:00 wan: configuring for phy/gmii link mode                                                                       
root@bpi-r2:~# [ 2326.952615] mt7530 mdio-bus:00 wan: Link is Up - 1Gbps/Full - flow control off                                                
                                                                                                                                                
root@bpi-r2:~# iperf -c 192.168.0.21                                                                                                            
------------------------------------------------------------                                                                                    
Client connecting to 192.168.0.21, TCP port 5001                                                                                                
TCP window size: 43.8 KByte (default)                                                                                                           
------------------------------------------------------------                                                                                    
[  3] local 192.168.0.11 port 35702 connected with 192.168.0.21 port 5001                                                                       
[ ID] Interval       Transfer     Bandwidth                                                                                                     
[  3]  0.0-10.0 sec  1.09 GBytes   940 Mbits/sec                                                                                                
root@bpi-r2:~# ip link set wan down                                                                                                             
[ 2454.117736] mt7530 mdio-bus:00 wan: Link is Down                                                                                             
root@bpi-r2:~# ip link set lan0 up                                                                                                              
[ 2458.038099] mt7530 mdio-bus:00 lan0: configuring for phy/gmii link mode                                                                      
root@bpi-r2:~#                                                                                                                                  
root@bpi-r2:~# [ 2465.352619] mt7530 mdio-bus:00 lan0: Link is Up - 1Gbps/Full - flow control off                                               
                                                                                                                                                
root@bpi-r2:~# iperf -c 192.168.0.21                                                                                                            
------------------------------------------------------------                                                                                    
Client connecting to 192.168.0.21, TCP port 5001                                                                                                
TCP window size: 43.8 KByte (default)                                                                                                           
------------------------------------------------------------                                                                                    
[  3] local 192.168.0.19 port 50218 connected with 192.168.0.21 port 5001                                                                       
[ ID] Interval       Transfer     Bandwidth                                                                                                     
[  3]  0.0-10.0 sec  1.10 GBytes   942 Mbits/sec 

...

root@bpi-r2:~# uname -r                                                                                                                         
4.20.0-rc1-bpi-r2-gmac_test_dsa_only 

https://github.com/frank-w/BPI-R2-4.14/tree/4.20-gmac_test_dsa_only

i make some additional tests, but it looks well now :)

regards Frank
