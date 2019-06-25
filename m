From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: mt7530: Add
 mediatek,ephy-handle to isolate external phy
Date: Tue, 25 Jun 2019 08:24:05 +0000
Message-ID: <20190625082405.Horde.AOfGPj5A9INWyS39F-pCQ27@www.vdorst.com>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-6-opensource@vdorst.com>
 <20190624215248.GC31306@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190624215248.GC31306@lunn.ch>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Andrew Lunn <andrew@lunn.ch>:

Hi Andrew,

>> +static int mt7530_isolate_ephy(struct dsa_switch *ds,
>> +			       struct device_node *ephy_node)
>> +{
>> +	struct phy_device *phydev = of_phy_find_device(ephy_node);
>> +	int ret;
>> +
>> +	if (!phydev)
>> +		return 0;
>> +
>> +	ret = phy_modify(phydev, MII_BMCR, 0, (BMCR_ISOLATE | BMCR_PDOWN));
>
> genphy_suspend() does what you want.

In case my device has AT8033 PHY which act as a RGMII-to-SGMII  
converter for the
SFP cage.

Qoute of the AR8031/33 datasheet:

The AR8033 device supports the low power mode with software power-down.
To enter the standard IEEE power-down mode, set the bit[11] POWER_DOWN of
Control register - copper page or Control register — fiber page to 1.
In this mode, AR8033 ignores all MAC interface signals except the MDC/MDIO and
does not respond to any activity on the media side. AR8033 cannot wake  
up on its
own and is only waken up by setting the POWER_DOWN bit to 0.


Does "standard IEEE power-down mode" describ this behavior that in power-down
mode the RGMII are also put in tri-state?

Reading the datasheet does not give me any clues.
Putting RGMII signals in tri-state is important in this case.

>
>> +	if (ret)
>> +		dev_err(ds->dev, "Failed to put phy %s in isolation mode!\n",
>> +			ephy_node->full_name);
>> +	else
>> +		dev_info(ds->dev, "Phy %s in isolation mode!\n",
>> +			 ephy_node->full_name);
>
> No need to clog up the system with yet more kernel messages.

OK, I remove it.

>
>    Andrew

Greats,

René
