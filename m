From: Daniel Santos <daniel.santos@pobox.com>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Fri, 28 Jun 2019 02:16:45 -0500
Message-ID: <56d8024e-1e02-7ff7-abf2-261ec9cbabf7@pobox.com>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk>
 <20190625113158.Horde.pCaJOVUsgyhYLd5Diz5EZKI@www.vdorst.com>
 <20190625121030.m5w7wi3rpezhfgyo@shell.armlinux.org.uk>
 <1ad9f9a5-8f39-40bd-94bb-6b700f30c4ba@pobox.com>
 <20190625190246.GA27733@lunn.ch>
 <4fc51dc4-0eec-30d7-86d1-3404819cf6fe@pobox.com>
 <20190625204148.GB27733@lunn.ch>
 <e469daa1-3e28-db9c-e29a-7f68cc676fda@pobox.com>
 <20190627192806.GQ27733@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190627192806.GQ27733@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hello Andrew,

On 6/27/19 2:28 PM, Andrew Lunn wrote:
>>> Looking at the data sheet page, you want FORCE_MODE_Pn set. You never
>>> want the MAC directly talking to the PHY. Bad things will happen.
>> So what exactly do you mean by the MAC directly talking to the PHY?=C2=
=A0 Do
>> you mean setting speed, duplex, etc. via the MAC registers instead of
>> via MDIO to the MII registers of the PHY?
> The data sheet implies the MAC hardware performs reads on the PHY to
> get the status, and then uses that to configure the MAC. This is often
> called PHY polling. The MAC hardware however has no idea what the PHY
> driver is doing. The MAC does not take the PHY mutex. So the PHY
> driver might be doing something at the same time the MAC hardware
> polls the PHY, and it gets odd results. Some PHYs have multiple pages,
> and for example reading the temperature sensor means swapping
> pages. If the MAC hardware was to poll while the sensor is being read,
> it would not get the link status, it would read some random
> temperature register.
>
> So you want the PHY driver to read the results of auto-neg and it then
> tell the MAC the results, so the MAC can be configured correctly.

Thank you, this is very helpful!=C2=A0 I finally understand why these
settings are in two different places. :)=C2=A0 Unfortunately this driver =
(in
OpenWRT) does a lot of "magic" during init to registers that I don't
have documentation for, but I see where auto-polling can be disabled now.

>>> Then use FORCE_RX_FC_Pn and FORCE_TX_Pn to reflect phydev->pause and
>>> phydev->asym_pause.
>>>
>>> The same idea applies when using phylink.
>>>
>>>     Andrew
>> You're help is greatly appreciated here.=C2=A0 Admittedly, I'm also tr=
ying to
>> get this working in the now deprecated swconfig for a 3.18 kernel that=
's
>> in production.
> I'm not very familiar with swconfig. Is there software driving the
> PHY? If not, it is then safe for the MAC hardware to poll the PHY.
>
>      Andrew

swconfig is an netlink-based interface the OpenWRT team developed for
configuring switches before DSA was converted into a vendor-neutral
interface.=C2=A0 Now that DSA does what swconfig was designed for it has =
been
deprecated, although (to my knowledge) we don't yet have DSA for all
devices that OpenWRT supports.

Daniel
