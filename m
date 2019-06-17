From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 0/2] net: mediatek: Add MT7621 TRGMII mode
 support
Date: Mon, 17 Jun 2019 21:33:12 +0000
Message-ID: <20190617213312.Horde.fcb9-g80Zzfd-IMC8EQy50h@www.vdorst.com>
References: <20190616182010.18778-1-opensource@vdorst.com>
 <20190617140223.GC25211@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190617140223.GC25211@lunn.ch>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sean Wang <sean.wang@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Andrew Lunn <andrew@lunn.ch>:

> On Sun, Jun 16, 2019 at 08:20:08PM +0200, René van Dorst wrote:
>> Like many other mediatek SOCs, the MT7621 SOC and the internal  
>> MT7530 switch both
>> supports TRGMII mode. MT7621 TRGMII speed is 1200MBit.
>
> Hi René
>

Hi Andrew,

> Is TRGMII used only between the SoC and the Switch? Or does external
> ports of the switch also support 1200Mbit/s? If external ports support
> this, what does ethtool show for Speed?

Only the first GMAC of the SOC and port 6 of the switch supports this mode.
The switch can be internal in the SOC but also a separate chip.

PHYLINK and ethertool reports the link as 1Gbit.
The link is fixed-link with speed = 1000.

dmesg output with unposted PHYLINK patches:
[    5.236763] mt7530 mdio-bus:1f: configuring for fixed/trgmii link mode
[    5.249813] mt7530 mdio-bus:1f: phylink_mac_config:  
mode=fixed/trgmii/1Gbps/Full adv=00,00000000,00000220 pause=12 link=1  
an=1
[    6.389435] mtk_soc_eth 1e100000.ethernet eth0: phylink_mac_config:  
mode=fixed/trgmii/1Gbps/Full adv=00,00000000,00000220 pause=12 link=1  
an=1

# ethtool eth0
Settings for eth0:
          Supported ports: [ MII ]
          Supported link modes:   1000baseT/Full
          Supported pause frame use: No
          Supports auto-negotiation: No
          Supported FEC modes: Not reported
          Advertised link modes:  1000baseT/Full
          Advertised pause frame use: No
          Advertised auto-negotiation: No
          Advertised FEC modes: Not reported
          Speed: 1000Mb/s
          Duplex: Full
          Port: MII
          PHYAD: 0
          Transceiver: internal
          Auto-negotiation: on
          Current message level: 0x000000ff (255)
                                 drv probe link timer ifdown ifup rx_err tx_err
          Link detected: yes



I already have report from a MT7623 user that this patch gives issues.

I send v2 of the patch if I fixed that issue.

Also I think it is better to add a XTAL frequency check.
The PLL values are only valid with a 40MHz crystal.

Any other comments for v2?

Greats,

René


>
>      Thanks
> 	Andrew
