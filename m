From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH RFC net-next 4/5] dt-bindings: net: dsa: mt7530: Add
 mediatek,ephy-handle to isolate ext. phy
Date: Tue, 25 Jun 2019 12:16:35 -0700
Message-ID: <1bcedae6-305d-5019-a7a1-e11ee9e99a7b@gmail.com>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-5-opensource@vdorst.com>
 <e6175753-eb99-63e5-767e-f82becbf8d1a@gmail.com>
 <20190625093042.Horde._8BNPFSzW6B9-CI8P6akHTh@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190625093042.Horde._8BNPFSzW6B9-CI8P6akHTh@www.vdorst.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
Cc: sean.wang@mediatek.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 6/25/19 2:30 AM, René van Dorst wrote:
> Quoting Florian Fainelli <f.fainelli@gmail.com>:
> 
> Hi Florian
> 
>> On 6/24/19 7:52 AM, René van Dorst wrote:
>>> On some platforum the external phy can only interface to the port 5
>>> of the
>>> switch because the RGMII TX and RX lines are swapped. But it still
>>> can be
>>> useful to use the internal phy of the switch to act as a WAN port which
>>> connectes to the 2nd GMAC. This gives WAN port dedicated bandwidth to
>>> the SOC. This increases the LAN and WAN routing.
>>>
>>> By adding the optional property mediatek,ephy-handle, the external phy
>>> is put in isolation mode when internal phy is connected to 2nd GMAC via
>>> phy-handle property.
>>
>> Most platforms we have seen so far implement this logic with a mdio-mux,
>> can you see if that is possible here? stmmac has plenty of examples like
>> those.
> 
> May I don't understand it correctly, but all the devices are on the same
> MDIO
> bus.
> I tried to make a ASCII diagram to make it a bit more clear.

Based on your diagram and your explanation, then I do not really see a
need for that property you can scan all of the switch port's properties
and determined which configuration is applied and perform the PHY
isolation as necessary. It looks like you are using this property as a
way to simplify your configuration logic, that is not quite what Device
Tree is meant for.
-- 
Florian
