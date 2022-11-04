Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48777C43217
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXnWGGdDSxQZTnpoLn7lHVsbinkh5chtlI8waYit954=; b=PZMVENBcHGhk80CDDxVAFfa0rQ
	JlJYSgkuUJFP+jiFEzabnlTrrs1MK74PMruZK0IlP5ZV0OXSAH49tj1PTm8FL7AMPJ1e7pFkA2IhQ
	18NAOzke96iKFRo408tyFyZqZad3BQTHRh92fV80uxzXp6KPWLeYVQAlgA0mZwmPbpxfbPySjRrTI
	mrWLmJJviAN9EPRwlnVPkj2MK587YT0usz1F6c30zzEyQmDzLrelarwC1aB7uY2/2P3tump0uywZa
	IyZRAvLmJ2axCHSRNxYkPqxpU4qCghJUz8ZPTjMCtwK7N8uGgn2hXcRZPN/PDaJO3DaiMV9AZ9gNJ
	QSl9UiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsdy-0032IH-Uv; Fri, 04 Nov 2022 09:05:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsdw-0032Hq-J9
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 09:05:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03674620E2;
	Fri,  4 Nov 2022 09:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEC8C433C1;
	Fri,  4 Nov 2022 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667552739;
	bh=ZSnfcbo7a554FxbRKiHzgm/4DxE8HZ48VBVyW0oWshY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtnQYKfKCY36RTupDEI2hU7Bui6ycF38v079aWJrvbzHn8pStbIKuNS/Zu/NYBPBV
	 XdvNghvD3CXYZvKlZCKBkQD2t822P//Ky9cLlvC5SWO1hg0+zaOmLol17zniGJ057z
	 XeM4mRa8DDFOXSHJORHmOePFjBYBS6RvCEB+psaQXTABlOv43TEfj2EQlItjHHWE3T
	 Aprmzp03KZui0SEj16c9UWWyepPwkUDt4KOAJx9RbfChR2+Y75IhWozY/gL6waRRSs
	 BAoW+5QcG4X440PgdnTfmtDPy64qC4uOdY+ZawYwuV42+ZyH0NFUIuxS9bMgBA+DTz
	 vHQ/eU+hjqYvg==
Date: Fri, 4 Nov 2022 10:05:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org,
	Sam.Shih@mediatek.com
Subject: Re: [PATCH v3 net-next 1/8] arm64: dts: mediatek: mt7986: add
 support for RX Wireless Ethernet Dispatch
Message-ID: <Y2TV34YFl/uySbiP@lore-desk>
References: <cover.1667466887.git.lorenzo@kernel.org>
 <4bd5f6626174ac042c0e9b9f2ffff40c3c72b88a.1667466887.git.lorenzo@kernel.org>
 <3046551a-62d7-2990-afb6-75fe2e20d8cb@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P7L9QEHRaBj8iPjh"
Content-Disposition: inline
In-Reply-To: <3046551a-62d7-2990-afb6-75fe2e20d8cb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_020540_727217_67881ABF 
X-CRM114-Status: GOOD (  23.71  )
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


--P7L9QEHRaBj8iPjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 03/11/22 10:28, Lorenzo Bianconi ha scritto:
> > Similar to TX Wireless Ethernet Dispatch, introduce RX Wireless Ethernet
> > Dispatch to offload traffic received by the wlan interface to lan/wan
> > one.
> >=20
> > Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Hello Lorenzo,

Hi Angelo,

> thanks for the patch! However, there's something to improve...
>=20
> > ---
> >   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 75 +++++++++++++++++++++++
> >   1 file changed, 75 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boo=
t/dts/mediatek/mt7986a.dtsi
> > index 72e0d9722e07..b0a593c6020e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>=20
> ..snip..
>=20
> > @@ -226,6 +252,12 @@ ethsys: syscon@15000000 {
> >   			 reg =3D <0 0x15000000 0 0x1000>;
> >   			 #clock-cells =3D <1>;
> >   			 #reset-cells =3D <1>;
> > +
> > +			ethsysrst: reset-controller {
>=20
> That's not right. It works, yes, but your ethsys rightfully declares #res=
et-cells,
> because it is supposed to also be a reset controller (even though I don't=
 see any
> reset controller registering action in clk-mt7986-eth.c).
>=20
> Please document the ethernet reset in the appropriate dt-bindings header =
and
> register the reset controller in clk-mt7986-eth.c.
>=20
> Finally, you won't need any "ti,syscon-reset" node, and resets will look =
like
>=20
> 	resets =3D <&ethsys MT7986_ETHSYS_SOMETHING_SWRST>;
>=20
> If you need any hint about how to do that, please check clk-mt8195-infra_=
ao.c.

reviewing the code I think we do not have any mt7986-eth reset line consume=
r at the
moment, since:
- mtk_eth_soc driver rely on syscon for resetting the chip writing directly=
 in the register
  in ethsys_reset()
- we do not rely on reset api in wed wo code.

I think we can just drop reset support in ethsys/wo-dlm nodes at the moment=
 (since it
is not used in this series) and convert the driver to reset api as soon as
we have proper support in clk-mt7986-eth.c (AFAIU sam will work on it).

Regards,
Lorenzo

>=20
> Regards,
> Angelo
>=20

--P7L9QEHRaBj8iPjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY2TV3wAKCRA6cBh0uS2t
rDvkAQDRi+dctkQ5LZ35L85BSvNNY1urFlysqWl8he4gt/A7lAD+PYMwbezhgc58
vi3XsNZV3Ai9yacwLFeEBnE3SbmpGQc=
=uq0/
-----END PGP SIGNATURE-----

--P7L9QEHRaBj8iPjh--

