From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 net-next 0/2] net: mediatek: Add MT7621 TRGMII mode support
Date: Thu, 20 Jun 2019 20:55:17 -0700
Message-ID: <CAGp9Lzon8QMO3=jwLYNO_je+x2E3E-Zocm=Do-=5x334GqZZLw@mail.gmail.com>
References: <20190620122155.32078-1-opensource@vdorst.com> <74C80E79-877C-4DEC-BC82-1195C3D0981F@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <74C80E79-877C-4DEC-BC82-1195C3D0981F@public-files.de>
Sender: netdev-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, vivien.didelot@gmail.com, netdev@vger.kernel.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jun 20, 2019 at 6:02 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Tested on Bananapi R2 (mt7623)
>
> Tested-by: "Frank Wunderlich" <frank-w@public-files.de>

These changes also look good to me, thanks for add the patch to enrich
different application variants.

Acked-by: Sean Wang <sean.wang@kernel.org>

>
> Am 20. Juni 2019 14:21:53 MESZ schrieb "Ren=C3=A9 van Dorst" <opensource@=
vdorst.com>:
> >Like many other mediatek SOCs, the MT7621 SOC and the internal MT7530
> >switch both supports TRGMII mode. MT7621 TRGMII speed is fix 1200MBit.
> >
> >v1->v2:
> > - Fix breakage on non MT7621 SOC
> > - Support 25MHz and 40MHz XTAL as MT7530 clocksource
> >
> >Ren=C3=A9 van Dorst (2):
> >  net: ethernet: mediatek: Add MT7621 TRGMII mode support
> >  net: dsa: mt7530: Add MT7621 TRGMII mode support
> >
> > drivers/net/dsa/mt7530.c                    | 46 ++++++++++++++++-----
> > drivers/net/dsa/mt7530.h                    |  4 ++
> > drivers/net/ethernet/mediatek/mtk_eth_soc.c | 38 +++++++++++++++--
> > drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 +++++
> > 4 files changed, 85 insertions(+), 14 deletions(-)
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
