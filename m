From: Daniel Santos <daniel.santos@pobox.com>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: mt7530: Add
 mediatek,ephy-handle to isolate external phy
Date: Mon, 24 Jun 2019 19:22:41 -0500
Message-ID: <2a421ed9-94ed-a454-29c2-f52f6a070a70@pobox.com>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-6-opensource@vdorst.com>
 <20190624215248.GC31306@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190624215248.GC31306@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
Cc: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 6/24/19 4:52 PM, Andrew Lunn wrote:
>> +static int mt7530_isolate_ephy(struct dsa_switch *ds,
>> +			       struct device_node *ephy_node)
>> +{
>> +	struct phy_device *phydev =3D of_phy_find_device(ephy_node);
>> +	int ret;
>> +
>> +	if (!phydev)
>> +		return 0;
>> +
>> +	ret =3D phy_modify(phydev, MII_BMCR, 0, (BMCR_ISOLATE | BMCR_PDOWN))=
;
> genphy_suspend() does what you want.
>
>> +	if (ret)
>> +		dev_err(ds->dev, "Failed to put phy %s in isolation mode!\n",
>> +			ephy_node->full_name);
>> +	else
>> +		dev_info(ds->dev, "Phy %s in isolation mode!\n",
>> +			 ephy_node->full_name);
> No need to clog up the system with yet more kernel messages.
>
>    Andrew
>
Yes, keep in mind that many mt7530-based devices have a 56k serial
console that gets ring buffer spew.=C2=A0 This created a real problem on =
the
mt7620 wifi drivers when they spewed every time a packet needed to be
dropped.=C2=A0 So at the very least, for any message that can be spammed,
rate limit it please.

Daniel
