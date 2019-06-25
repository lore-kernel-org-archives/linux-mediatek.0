From: Daniel Santos <daniel.santos@pobox.com>
Subject: Re: [PATCH RFC net-next 1/5] net: dsa: mt7530: Convert to PHYLINK API
Date: Tue, 25 Jun 2019 14:27:55 -0500
Message-ID: <4fc51dc4-0eec-30d7-86d1-3404819cf6fe@pobox.com>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-2-opensource@vdorst.com>
 <20190624153950.hdsuhrvfd77heyor@shell.armlinux.org.uk>
 <20190625113158.Horde.pCaJOVUsgyhYLd5Diz5EZKI@www.vdorst.com>
 <20190625121030.m5w7wi3rpezhfgyo@shell.armlinux.org.uk>
 <1ad9f9a5-8f39-40bd-94bb-6b700f30c4ba@pobox.com>
 <20190625190246.GA27733@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190625190246.GA27733@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux admin <linux@armlinux.org.uk>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 6/25/19 2:02 PM, Andrew Lunn wrote:
>> But will there still be a mechanism to ignore link partner's advertisi=
ng
>> and force these parameters?
> >From man 1 ethtool:
>
>        -a --show-pause
>               Queries the specified Ethernet device for pause parameter=
 information.
>
>        -A --pause
>               Changes the pause parameters of the specified Ethernet de=
vice.
>
>            autoneg on|off
>                   Specifies whether pause autonegotiation should be ena=
bled.
>
>            rx on|off
>                   Specifies whether RX pause should be enabled.
>
>            tx on|off
>                   Specifies whether TX pause should be enabled.
>
> You need to check the driver to see if it actually implements this
> ethtool call, but that is how it should be configured.
>
> 	Andrew
>
Thank you Andrew,

So in this context, my question is the difference between "enabling" and
"forcing".=C2=A0 Here's that register for the mt7620 (which has an mt7530=
 on
its die): https://imgur.com/a/pTk0668=C2=A0 I believe this is also what R=
en=C3=A9
is seeking clarity on?

Thanks,
Daniel
