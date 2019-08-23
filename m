From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: [PATCH net-next v3 0/3] net: ethernet: mediatek: convert to
 PHYLINK
Date: Fri, 23 Aug 2019 19:56:53 +0200
Message-ID: <trinity-df75d11a-c27f-4941-a880-b017ebabd3dc-1566583013438@3c-app-gmx-bs75>
References: <20190823134516.27559-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190823134516.27559-1-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Stefan Roese <sr@denx.de>, =?UTF-8?Q?=22Ren=C3=A9_van_Dorst=22?= <opensource@vdorst.com>
List-Id: linux-mediatek@lists.infradead.org

tested on bpi-r2 (mt7623/mt7530) and bpi-r64 (mt7622/rtl8367)

as reported to rene directly rx-path needs some rework because current rx-=
speed
on bpi-r2 is 865 Mbits/sec instead of ~940 Mbits/sec

Tested-by: Frank Wunderlich <frank-w@public-files=2Ede>

regards Frank


> Gesendet: Freitag, 23=2E August 2019 um 15:45 Uhr
> Von: "Ren=C3=A9 van Dorst" <opensource@vdorst=2Ecom>
> An: "John Crispin" <john@phrozen=2Eorg>, "Sean Wang" <sean=2Ewang@mediat=
ek=2Ecom>, "Nelson Chang" <nelson=2Echang@mediatek=2Ecom>, "David S =2E Mil=
ler" <davem@davemloft=2Enet>, "Matthias Brugger" <matthias=2Ebgg@gmail=2Eco=
m>
> Cc: netdev@vger=2Ekernel=2Eorg, linux-arm-kernel@lists=2Einfradead=2Eorg=
, linux-mediatek@lists=2Einfradead=2Eorg, linux-mips@vger=2Ekernel=2Eorg, "=
Russell King" <linux@armlinux=2Eorg=2Euk>, "Frank Wunderlich" <frank-w@publ=
ic-files=2Ede>, "Stefan Roese" <sr@denx=2Ede>, "Ren=C3=A9 van Dorst" <opens=
ource@vdorst=2Ecom>
> Betreff: [PATCH net-next v3 0/3] net: ethernet: mediatek: convert to PHY=
LINK
>
> These patches converts mediatek driver to PHYLINK API=2E
>=20
> v2->v3:
> * Phylink improvements and clean-ups after review
> v1->v2:
> * Rebase for mt76x8 changes
> * Phylink improvements and clean-ups after review
> * SGMII port doesn't support 2=2E5Gbit in SGMII mode only in BASE-X mode=
=2E
>   Refactor the code=2E
>=20
> Ren=C3=A9 van Dorst (3):
>   net: ethernet: mediatek: Add basic PHYLINK support
>   net: ethernet: mediatek: Re-add support SGMII
>   dt-bindings: net: ethernet: Update mt7622 docs and dts to reflect the
>     new phylink API
>=20
>  =2E=2E=2E/arm/mediatek/mediatek,sgmiisys=2Etxt        |   2 -
>  =2E=2E=2E/dts/mediatek/mt7622-bananapi-bpi-r64=2Edts  |  28 +-
>  arch/arm64/boot/dts/mediatek/mt7622=2Edtsi      |   1 -
>  drivers/net/ethernet/mediatek/Kconfig         |   2 +-
>  drivers/net/ethernet/mediatek/mtk_eth_path=2Ec  |  75 +--
>  drivers/net/ethernet/mediatek/mtk_eth_soc=2Ec   | 529 ++++++++++++-----=
-
>  drivers/net/ethernet/mediatek/mtk_eth_soc=2Eh   |  68 ++-
>  drivers/net/ethernet/mediatek/mtk_sgmii=2Ec     |  65 ++-
>  8 files changed, 477 insertions(+), 293 deletions(-)
>=20
> --=20
> 2=2E20=2E1
>=20
>
