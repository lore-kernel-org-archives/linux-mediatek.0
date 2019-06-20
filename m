From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v2 net-next 0/2] net: mediatek: Add MT7621 TRGMII mode support
Date: Thu, 20 Jun 2019 15:02:04 +0200
Message-ID: <74C80E79-877C-4DEC-BC82-1195C3D0981F@public-files.de>
References: <20190620122155.32078-1-opensource@vdorst.com>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190620122155.32078-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>, sean.wang@mediatek.com, f.fainelli@gmail.com, davem@davemloft.net, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com
Cc: netdev@vger.kernel.org, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Tested on Bananapi R2 (mt7623)

Tested-by: "Frank Wunderlich" <frank-w@public-files=2Ede>

Am 20=2E Juni 2019 14:21:53 MESZ schrieb "Ren=C3=A9 van Dorst" <opensource=
@vdorst=2Ecom>:
>Like many other mediatek SOCs, the MT7621 SOC and the internal MT7530
>switch both supports TRGMII mode=2E MT7621 TRGMII speed is fix 1200MBit=
=2E
>
>v1->v2:=20
> - Fix breakage on non MT7621 SOC
> - Support 25MHz and 40MHz XTAL as MT7530 clocksource
>
>Ren=C3=A9 van Dorst (2):
>  net: ethernet: mediatek: Add MT7621 TRGMII mode support
>  net: dsa: mt7530: Add MT7621 TRGMII mode support
>
> drivers/net/dsa/mt7530=2Ec                    | 46 ++++++++++++++++-----
> drivers/net/dsa/mt7530=2Eh                    |  4 ++
> drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec | 38 +++++++++++++++--
> drivers/net/ethernet/mediatek/mtk_eth_soc=2Eh | 11 +++++
> 4 files changed, 85 insertions(+), 14 deletions(-)
