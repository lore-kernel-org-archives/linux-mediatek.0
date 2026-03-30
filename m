Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E163F1061B17
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2026 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/ZohPn0tEwclWEs73U7FxbLocJmGnnoEpSpxL5nBww=; b=IWv2iGc6W5X9Qo0RS6YO6i60ZY
	FeGWH7XzXeYSZj5k1J2daGEfqVTBj1vscK4jToNtcWtzAZf/wRzBr26k0IrQm+3nXWuGaLkqLcAm9
	Cd1pGH/e/1kdWrXo+Ak+M5B1uk+qMN14WwAPQp4Se9t6veebP/XyxtbNgZfSdbOUeb9kBrgfuXzG8
	BZD22ihyU1oUyts+2yQ/hHVlANj1eTR/WmgF7LJKnOXfOWOLV/OFcU1AMek3Cwg/QaS/hSFafTjbZ
	vqUP7EUwZfiBxSRGkbBrsicdy2xjEH+BfNJr8NuJl2WcMBU8Hj9Uzi6UJbLz2txxKUPPLhmNQtTZb
	nE6rQL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7GnD-0000000Bi1D-1nb8;
	Mon, 30 Mar 2026 17:52:51 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7GnA-0000000Bhzp-2MtL
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Mar 2026 17:52:50 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774893142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/ZohPn0tEwclWEs73U7FxbLocJmGnnoEpSpxL5nBww=;
	b=HT/utHUc8lgdICl+7AKP2eUGWqGS87jeJCjNhlM/axXVP2uTR1zAEx7oxBP2d7gF9Ptfg5
	br7hixyyJVb0342CKYZWVHZXIS5gxQFeCl6mlfA2LaO6JAsv8xnFOD6/VmXRCnWIngNnRD
	ZEz3Dt9vAyTkqK/rpdquDTmF+EevXqY=
Date: Mon, 30 Mar 2026 17:52:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <d9639ac711ff8f1186a684fa120ba77247669051@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v4 net-next 5/5] net: pcs: pcs-mtk-lynxi: deprecate
 "mediatek,pnswap"
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "Daniel
 Golle" <daniel@makrotopia.org>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "=?utf-8?B?QmriiJriiI9ybiBNb3Jr?="
 <bjorn@mork.no>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Heiner Kallweit"
 <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Eric Woudstra"
 <ericwouds@gmail.com>, "Alexander Couzens" <lynxis@fe80.eu>, "Chester A.
 Unal" <chester.a.unal@arinc9.com>, "DENG Qingfang" <dqfext@gmail.com>,
 "Sean Wang" <sean.wang@mediatek.com>, "Felix Fietkau" <nbd@nbd.name>
In-Reply-To: <20260326215404.krh6v3mmnqdlndli@skbuf>
References: <20260119091220.1493761-1-vladimir.oltean@nxp.com>
 <20260119091220.1493761-6-vladimir.oltean@nxp.com>
 <e0ad52862d34cf4e0169c9850a7f164f127d0093@linux.dev>
 <20260326215404.krh6v3mmnqdlndli@skbuf>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_105249_200867_294C814E 
X-CRM114-Status: GOOD (  24.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Vladimir

Thanks for the patch and sorry for my delay...i was away this weekend so =
i was not able to test.

traffic works again (but there is only read now) and this is the result o=
f your debug prints:

root@bpi-r3:~# dmesg | grep SGMSYS_QPHY_WRAP_CTRL
[    2.706963] SGMSYS_QPHY_WRAP_CTRL =3D 0x501, intending to write 0x500
[    9.134081] SGMSYS_QPHY_WRAP_CTRL =3D 0x500, intending to write 0x500

R3/mt7986 has 2 MAC, and switch is on the first, so value will change, no=
t sure why this is different.

i have not found SGMSYS_QPHY_WRAP_CTRL or something related with polarity=
 in ethernet/mac-=20
(drivers/net/ethernet/mediatek/mtk_eth_soc.c)=20or switch-driver (drivers=
/net/dsa/mt7530{,-mdio}.c)
in case they manipulate this register too (of course they should not). Al=
so looked into the pcs-handling
in both drivers, but see nothing related to polarity. And looked for poss=
ible duplicate register const
definition (other name for 0xec).

regards Frank

Am 26. M=C3=A4rz 2026 um 22:54 schrieb "Vladimir Oltean" <vladimir.oltean=
@nxp.com>:
>=20
>=20Hi Frank,
>=20
>=20On Tue, Mar 24, 2026 at 06:36:44AM +0000, Frank Wunderlich wrote:
>=20
>=20>=20
>=20> Hi,
> >=20=20
>=20>  looks like this patch breaks BPI-R3 serdes between mt7986 SoC and =
mt7531 switch in 7.0 (6.19 is ok).
> >  in ethtool i see only tx on mac but no rx. if i revert this patch i =
can ping through dsa-ports again.
> >=20=20
>=20>  i did not completely understanding the code with the default-pol a=
s it is now splitted between rx and tx.
> >=20=20
>=20>  mt7986 and this board does not have mediatek,pnswap set, so the fi=
nal regmap_update_bits writes val=3D0,
> >  before there was only write to this register on invert mode...but i =
guess this should not break. Maybe some
> >  kind of timing issue between mac and switch?
> >=20=20
>=20>  maybe reverting this patch skips changes made here:
> >  bde1ae2d52ab 2026-01-19 net: pcs: pcs-mtk-lynxi: pass SGMIISYS OF no=
de to PCS
> >=20=20
>=20>  I resend as last try was sending as html (option "always send as t=
ext" in webmailer seems to be ignored
> >  somehow, had to choose "unformatted" in this response too).
> >=20=20
>=20>  regards Frank
> >=20
>=20Sorry for the delay.
>=20
>=20If writing val=3D0 breaks the link, I'm curious
> (a) whether it still breaks if we don't write anything at all
> (b) what was the register value originally
>=20
>=20Could you please test the patch below and let me know what it prints,
> and whether traffic passes with it applied?
>=20
>=20-- >8 --
> diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-=
lynxi.c
> index c12f8087af9b..5c5f45b93b82 100644
> --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> @@ -126,7 +126,7 @@ static int mtk_pcs_config_polarity(struct mtk_pcs_l=
ynxi *mpcs,
>  {
>  struct fwnode_handle *fwnode =3D mpcs->fwnode, *pcs_fwnode;
>  unsigned int pol, default_pol =3D PHY_POL_NORMAL;
> - unsigned int val =3D 0;
> + unsigned int val =3D 0, tmp;
>  int ret;
>=20=20
>=20 if (fwnode_property_read_bool(fwnode, "mediatek,pnswap"))
> @@ -153,8 +153,14 @@ static int mtk_pcs_config_polarity(struct mtk_pcs_=
lynxi *mpcs,
>  if (pol =3D=3D PHY_POL_INVERT)
>  val |=3D SGMII_PN_SWAP_TX;
>=20=20
>=20- return regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_WRAP_CTRL,
> - SGMII_PN_SWAP_RX | SGMII_PN_SWAP_TX, val);
> + ret =3D regmap_read(mpcs->regmap, SGMSYS_QPHY_WRAP_CTRL, &tmp);
> + if (ret)
> + return ret;
> +
> + pr_err("SGMSYS_QPHY_WRAP_CTRL =3D 0x%x, intending to write 0x%lx\n",
> + tmp, (tmp & ~(SGMII_PN_SWAP_RX | SGMII_PN_SWAP_TX)) | val);
> +
> + return 0;
>  }
>=20=20
>=20 static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned in=
t neg_mode,
> -- >8 --
>=20

regards=20Frank

