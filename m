From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 0/2] net: mediatek: Add MT7621 TRGMII mode
 support
Date: Mon, 17 Jun 2019 19:21:26 -0700
Message-ID: <7f2fc770-1787-72f8-b91d-e2b12e74d39e@gmail.com>
References: <20190616182010.18778-1-opensource@vdorst.com>
 <20190617140223.GC25211@lunn.ch>
 <20190617213312.Horde.fcb9-g80Zzfd-IMC8EQy50h@www.vdorst.com>
 <20190617214428.GO17551@lunn.ch>
 <20190617232004.Horde.mAVymZdeb9Jjf29W2PeOggU@www.vdorst.com>
 <20190618015309.GA18088@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190618015309.GA18088@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
Cc: Sean Wang <sean.wang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 6/17/2019 6:53 PM, Andrew Lunn wrote:
>> By adding some extra speed states in the code it seems to work.
>>
>> +               if (state->speed == 1200)
>> +                       mcr |= PMCR_FORCE_SPEED_1000;
> 
> Hi René
> 
> Is TRGMII always 1.2G? Or can you set it to 1000 or 1200? This
> PMCR_FORCE_SPEED_1000 feels wrong.

It is not uncommon to have to "force" 1G to get a higher speed, there is
something similar with B53 switches configuring the CPU ports at 2GB/sec
(proprietary too and not standardized either).

> 
>>> We could consider adding 1200BaseT/Full?
>>
>> I don't have any opinion about this.
>> It is great that it shows nicely in ethtool but I think supporting more
>> speeds in phy_speed_to_str() is enough.
>>
>> Also you may want to add other SOCs trgmii ranges too:
>> - 1200BaseT/Full for mt7621 only
>> - 2000BaseT/Full for mt7623 and mt7683
>> - 2600BaseT/Full for mt7623 only
> 
> Are these standardised in any way? Or MTK proprietary?  Also, is the T
> in BaseT correct? These speeds work over copper cables? Or should we
> be talking about 1200BaseKX?

Looks like this is MTK proprietary:

http://lists.infradead.org/pipermail/linux-mediatek/2016-September/007083.html
https://patchwork.kernel.org/patch/9341129/
-- 
Florian
