Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6E5D116F2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2026 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+Y5FvcTlFgFN2SNN70xIA2iRj8AOL6L5zCnK8NYSpA=; b=BIl7qRsPU2/YQUqj1AT63kyBpD
	lV53+sYWSwna6T3gR2vSfjVUSj7G0J2UFVKyha/GN/NmSsB8vmg4IQ0WSOFlG/e6+DrdYx8QsuCnq
	/YGQBkrHlAESDnZLOOctvNYIeI9DEp0KCWKYyWWgs0+eDYQsV7VwUBAf+2InAEjJcryJiB/LkpQFw
	se2ACbfi01HMVxK8cpMFh+9ivHr10IBXTncHBYjN4K6mt9nqvPMxBcpU9gmtUBfTXMZYxD3O0Hvm8
	CSW+oosw+LMbsL6sv3wpWkBBDZQg5s3dSkz1T7oOi8X3if2gsiTkrlEynRfarUwDw+9PTwDpPCwNQ
	XoxKFQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zol-00000001i1O-2cfZ;
	Fri, 03 Apr 2026 08:23:51 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Zoi-00000001i10-3ilE
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Apr 2026 08:23:50 +0000
Date: Fri, 03 Apr 2026 10:23:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775204622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f+Y5FvcTlFgFN2SNN70xIA2iRj8AOL6L5zCnK8NYSpA=;
	b=YfzU6jsSMYkGjW+dM1NzvctmmMgu3rk4l4KeGBkxoE7aSsZDJR2lUFz7oKeTAZ0YbdOzFT
	COP6uMo8Qza9UTyWgOmccf4tx0910dOXSC9sl/cYe9uUrKpMc8juHNMla3yS8ZsUycQP4s
	RZ/bLJmOZeZCY22IprH328WgwSaqkbE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Frank Wunderlich <frank.wunderlich@linux.dev>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 =?UTF-8?B?QmriiJriiI9ybiBNb3Jr?= <bjorn@mork.no>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_net-next_5/5=5D_net=3A_pcs=3A_pc?=
 =?US-ASCII?Q?s-mtk-lynxi=3A_deprecate_=22mediatek=2Cpnswap=22?=
In-Reply-To: <20260402095300.hujib22ag6g5wkts@skbuf>
References: <20260119091220.1493761-1-vladimir.oltean@nxp.com> <20260119091220.1493761-6-vladimir.oltean@nxp.com> <e0ad52862d34cf4e0169c9850a7f164f127d0093@linux.dev> <20260326215404.krh6v3mmnqdlndli@skbuf> <d9639ac711ff8f1186a684fa120ba77247669051@linux.dev> <20260330190443.bol5vjfqqitz7kuo@skbuf> <4dbc3dabfdbc3bdf6b8d411e62a27fa8988e3388@linux.dev> <20260402095300.hujib22ag6g5wkts@skbuf>
Message-ID: <C59EED96-3973-4074-A4D8-C264949D447E@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_012349_168892_99E2608C 
X-CRM114-Status: GOOD (  28.18  )
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



Am 2=2E April 2026 11:53:00 MESZ schrieb Vladimir Oltean <vladimir=2Eoltea=
n@nxp=2Ecom>:
>On Thu, Apr 02, 2026 at 05:50:33AM +0000, Frank Wunderlich wrote:
>> Hi,
>
>Hi,
>
>Please don't top-post :(

Sorry about that=2E Try to do better future :)

I keep context for now (not removing my findings from early mail),i hope i=
t is ok=2E

Maybe daniel or mtk can respond if my understanding is wrong=2E

>> i tried using these properties in sgmiisys0 node (which should be mappe=
d to mac0 and the mt7530 switch) without success [1]=2E
>>=20
>> it looks like these properties are not read somewhere=2E
>
>Can you please clarify whether your problem is with the SerDes connected
>to a switch port or to a GMAC?

From=20my tests it looks like the issue is on switch side=2E

>Because if to a switch port, mt7531_create_sgmii() doesn't have any
>phandle to the SGMIISYS=2E That was from existing code=2E
>
>		pcs =3D mtk_pcs_lynxi_create(priv->dev, NULL, regmap,
>					   MT7531_PHYA_CTRL_SIGNAL3);
>
>The LynxI PCS will be instantiated without a fwnode and only the
>defaults will apply=2E

This was a good hint, i had only seen the pcs call for mac=2E

>> the flow is
>>=20
>> mtk_probe (eth driver)
>>=20
>> if (MTK_HAS_CAPS(eth->soc->caps, MTK_SGMII)) {
>> 	err =3D mtk_sgmii_init(eth);
>>=20
>> and there calling mtk_pcs_lynxi_create with the sgmiisys-node (for each=
 mac, so imho mac0=3Dsgmiisys0)
>> but handling the sgmiisys only as syscon, not a "real" pcs node [2]=2E
>>=20
>> but your new code calls phy_get_tx_polarity and should read out this pr=
operties, but from subnode "pcs", so next try was
>>=20
>> &sgmiisys0 {
>> 	pcs {
>> 		rx-polarity =3D <PHY_POL_NORMAL>;
>> 		tx-polarity =3D <PHY_POL_INVERT>;
>> 	};
>> };
>>=20
>> which results in completely strange behaviour (looks like sgmiisys1 is =
mapped to mac0, but based on code in mtk_sgmii_init 0=3D0 should be right):
>>=20
>> [    2=2E765218] SGMSYS_QPHY_WRAP_CTRL =3D 0x501, will write 0x500
>> [    9=2E143849] SGMSYS_QPHY_WRAP_CTRL =3D 0x500, will write 0x501
>>=20
>> but nevertheless i tried changing sgmiisys0 to sgmiisys1 and got the da=
me result as before
>>=20
>> [    2=2E713644] SGMSYS_QPHY_WRAP_CTRL =3D 0x501, will write 0x500
>> [    9=2E061509] SGMSYS_QPHY_WRAP_CTRL =3D 0x500, will write 0x500
>>=20
>> i can only change the second serdes with sgmiisys0, but not the first=
=2E
>
>I assume the second SerDes is mapped to a GMAC port which does
>instantiate the LynxI PCS with a fwnode, right? If so, the behaviour is
>consistent with the code=2E Only mtk-soc-eth uses mediatek,sgmiisys AFAIC=
S=2E
>
>> mapping between mac and sgmiisys in dts in mt7986a=2Edtsi [3] are like =
this:
>>=20
>> eth: ethernet@15100000 {
>> 	compatible =3D "mediatek,mt7986-eth";
>> 	mediatek,sgmiisys =3D <&sgmiisys0>, <&sgmiisys1>;
>> 	=2E=2E=2E
>> };
>>=20
>> &eth {
>> 	status =3D "okay";
>>=20
>> 	gmac0: mac@0 {
>> 		compatible =3D "mediatek,eth-mac";
>> 	=2E=2E=2E
>> 	};
>>=20
>> 	gmac1: mac@1 {
>> 		compatible =3D "mediatek,eth-mac";
>> 	=2E=2E=2E
>> 	};
>> };
>>=20
>> maybe it is time to revive the PCS framework discussion ([4]-[6])?
>>=20
>> [1] https://github=2Ecom/frank-w/BPI-Router-Linux/commit/4846a7bb352fe5=
911136cba33813f099bac035fd
>> [2] https://elixir=2Ebootlin=2Ecom/linux/v7=2E0-rc4/source/drivers/net/=
ethernet/mediatek/mtk_eth_soc=2Ec#L5001
>> [3] https://elixir=2Ebootlin=2Ecom/linux/v7=2E0-rc4/source/arch/arm64/b=
oot/dts/mediatek/mt7986a=2Edtsi#L528
>>=20
>> [4] * https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/20250610=
233134=2E3588011-4-sean=2Eanderson@linux=2Edev/ (v6)
>> > pcs-framework itself had not yet got a response from netdev maintaine=
r (only other parts)
>> [5] * https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/20250511=
201250=2E3789083-4-ansuelsmth@gmail=2Ecom/ (v4)
>> > discussion: https://lore=2Ekernel=2Eorg/netdev/20250511201250=2E37890=
83-1-ansuelsmth@gmail=2Ecom/
>> [6] * https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/ba4e3595=
84a6b3bc4b3470822c42186d5b0856f9=2E1721910728=2Egit=2Edaniel@makrotopia=2Eo=
rg/
>> > discussion: https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/=
8aa905080bdb6760875d62cb3b2b41258837f80e=2E1702352117=2Egit=2Edaniel@makrot=
opia=2Eorg/
>
>I'm not exactly sure how device+driver for the PCS devices would help in
>this case though? Because the LynxI PCS driver would just retrieve the
>fwnode on its own, rather than it being passed by the mtk_pcs_lynxi_creat=
e()
>caller?

Imho it could be more general and cleaner than calling "external" function=
 in code=2E If pcs acts
as own device i would see which dtnode is assigned to it=2E=2E=2Ehere i gu=
essed both calls were
from mac,but one was from mac and one from switch=2E
I tried adding prints before the lynxi call,but this does not make it clea=
n from where it comes (i guess because of threading)=2E=2E=2Ebut this could=
 be understanding issue on my side=2E

It looked like this:

root@bpi-r3:~# dmesg | grep 'SGMSYS_QPHY_WRAP_CTRL\|pcs'
[    2=2E155221] mtk_soc_eth 15100000=2Eethernet: create sgmii pcs for mac=
 #0
[    2=2E168308] mtk_soc_eth 15100000=2Eethernet: create sgmii pcs for mac=
 #1
[    2=2E699744] mt7530-mdio mdio-bus:1f: add lynxi pcs for switch (port5)
[    2=2E706773] mt7530-mdio mdio-bus:1f: add lynxi pcs for switch (port6)
[    2=2E707881] SGMSYS_QPHY_WRAP_CTRL =3D 0x501, will write 0x501
[    9=2E081259] SGMSYS_QPHY_WRAP_CTRL =3D 0x500, will write 0x500

>We need to have a very good model of what happens when the PCS provider
>goes away, especially in multi-port scenarios=2E It is a similar issue as
>to what happens when a phy_device goes away=2E
>https://lore=2Ekernel=2Eorg/netdev/20260311153421=2Eu454m3e4blkstymt@skbu=
f/
>
>I'm not saying "let's not do that", but we'd effectively introducing an
>issue that currently does not exist, with the PCS lifetime being managed
>by the consumer=2E
>
>Do you have any better idea by now why SGMSYS_QPHY_WRAP_CTRL is 0x501
>for SGMIISYS #0? Is that its out-of-reset value?

We guess that switch takes this value somehow from an efuse or similar=2E

I have 2 ways to fix this broken state:

1) to keep dts backward compatibility and due to undocumented behaviour i =
prefer this patch:

--- a/drivers/net/pcs/pcs-mtk-lynxi=2Ec
+++ b/drivers/net/pcs/pcs-mtk-lynxi=2Ec
@@ -129,6 +129,9 @@ static int mtk_pcs_config_polarity(struct mtk_pcs_lynx=
i *mpcs,
 	unsigned int val =3D 0, tmp;
 	int ret;
=20
+	if (!fwnode)
+		return 0;
+
 	if (fwnode_property_read_bool(fwnode, "mediatek,pnswap"))
 		default_pol =3D PHY_POL_INVERT;

2) document pcs polarity (i'm still unsure if this is really correct as i =
cannot measure in hardware,just from software debugging=2E=2E=2Ebut not sur=
e if the SGMSYS_QPHY_WRAP_CTRL offset is valid on switch regmap too) - it l=
ooks for me that by default is different between mac and switch side:

<https://github=2Ecom/frank-w/BPI-Router-Linux/commit/f693e2ed24287ce1e125=
d7f6202e14e263cc564d>

And add dts nodes like this:
<https://github=2Ecom/frank-w/BPI-Router-Linux/commit/4f7bce943dda614d2443=
1d63adad65f1117a7f6d>

If i set same polarity to mac it is broken (thats why sgmiisys0 is disable=
d)=2E I guess the pnswap property means "invert the default behaviour" and =
not "use inverted polarity compared to standard" and mac and switch use the=
 same polarity with different values of the corresponding registers=2E

Based on my register documentation of mt7531 ("MT7531_Reference_Manual_for=
_Development_Board=2Epdf" page 729) i see

000050EC =3D QPHY_WRAP_CTRL
Bit 0
1'b1 : inversed TX_BIT_POLARITY TX bit polarity control (TX default invers=
ed in MT7531)

Where bit 1 is only defined as "RX bit polarity control"

So my guess is that tx is inverted in hardware,but tx-bit is set in efuse =
to get the POL_NORMAL=2E

I did not find the register in my mt7986 register documentation=2E=2E=2Ese=
ems complete networking part is missing=2E

I do not expect that board changes polarity in hardware=2E=2E=2E

Regards Frank

