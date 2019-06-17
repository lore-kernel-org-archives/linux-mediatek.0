From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 0/2] net: mediatek: Add MT7621 TRGMII mode
 support
Date: Mon, 17 Jun 2019 23:20:04 +0000
Message-ID: <20190617232004.Horde.mAVymZdeb9Jjf29W2PeOggU@www.vdorst.com>
References: <20190616182010.18778-1-opensource@vdorst.com>
 <20190617140223.GC25211@lunn.ch>
 <20190617213312.Horde.fcb9-g80Zzfd-IMC8EQy50h@www.vdorst.com>
 <20190617214428.GO17551@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190617214428.GO17551@lunn.ch>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sean Wang <sean.wang@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Andrew Lunn <andrew@lunn.ch>:

Hi Andrew,

> On Mon, Jun 17, 2019 at 09:33:12PM +0000, René van Dorst wrote:
>> Quoting Andrew Lunn <andrew@lunn.ch>:
>>
>> >On Sun, Jun 16, 2019 at 08:20:08PM +0200, René van Dorst wrote:
>> >>Like many other mediatek SOCs, the MT7621 SOC and the internal MT7530
>> >>switch both
>> >>supports TRGMII mode. MT7621 TRGMII speed is 1200MBit.
>> >
>> >Hi René
>> >
>>
>> Hi Andrew,
>>
>> >Is TRGMII used only between the SoC and the Switch? Or does external
>> >ports of the switch also support 1200Mbit/s? If external ports support
>> >this, what does ethtool show for Speed?
>>
>> Only the first GMAC of the SOC and port 6 of the switch supports this mode.
>> The switch can be internal in the SOC but also a separate chip.
>>
>> PHYLINK and ethertool reports the link as 1Gbit.
>> The link is fixed-link with speed = 1000.
>>
>> dmesg output with unposted PHYLINK patches:
>> [    5.236763] mt7530 mdio-bus:1f: configuring for fixed/trgmii link mode
>> [    5.249813] mt7530 mdio-bus:1f: phylink_mac_config:
>> mode=fixed/trgmii/1Gbps/Full adv=00,00000000,00000220 pause=12 link=1 an=1
>> [    6.389435] mtk_soc_eth 1e100000.ethernet eth0: phylink_mac_config:
>> mode=fixed/trgmii/1Gbps/Full adv=00,00000000,00000220 pause=12 link=1 an=1
>
> With PHYLINK, you can probably set the fixed link to the true 1.2Gbps.

By adding some extra speed states in the code it seems to work.

+               if (state->speed == 1200)
+                       mcr |= PMCR_FORCE_SPEED_1000;

dmesg:
[    5.261375] mt7530 mdio-bus:1f: configuring for fixed/trgmii link mode
[    5.274390] mt7530 mdio-bus:1f: phylink_mac_config:  
mode=fixed/trgmii/Unsupported (update phy-core.c)/Full  
adv=00,00000000,00000200 pause=12 link=1 an=1
[    6.296614] mtk_soc_eth 1e100000.ethernet eth0: configuring for  
fixed/trgmii link mode
[    6.313608] mtk_soc_eth 1e100000.ethernet eth0: phylink_mac_config:  
mode=fixed/trgmii/Unsupported (update phy core.c)/Full  
adv=00,00000000,00000200 pause=12 link=1 an=1

# ethtool eth0
Settings for eth0:
         Supported ports: [ MII ]
         Supported link modes:   Not reported
         Supported pause frame use: No
         Supports auto-negotiation: No
         Supported FEC modes: Not reported
         Advertised link modes:  Not reported
         Advertised pause frame use: No
         Advertised auto-negotiation: No
         Advertised FEC modes: Not reported
         Speed: 1200Mb/s
         Duplex: Full
         Port: MII
         PHYAD: 0
         Transceiver: internal
         Auto-negotiation: on
         Current message level: 0x000000ff (255)
                                drv probe link timer ifdown ifup rx_err tx_err
         Link detected: yes


>> # ethtool eth0
>> Settings for eth0:
>>          Supported ports: [ MII ]
>>          Supported link modes:   1000baseT/Full
>>          Supported pause frame use: No
>>          Supports auto-negotiation: No
>>          Supported FEC modes: Not reported
>>          Advertised link modes:  1000baseT/Full
>>          Advertised pause frame use: No
>>          Advertised auto-negotiation: No
>>          Advertised FEC modes: Not reported
>>          Speed: 1000Mb/s
>
> We could consider adding 1200BaseT/Full?

I don't have any opinion about this.
It is great that it shows nicely in ethtool but I think supporting more
speeds in phy_speed_to_str() is enough.

Also you may want to add other SOCs trgmii ranges too:
- 1200BaseT/Full for mt7621 only
- 2000BaseT/Full for mt7623 and mt7683
- 2600BaseT/Full for mt7623 only

I leave the decision to you.

Greats,

René

>
>    Andrew
