Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D20C77B62
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5RsCk6hnmp/jY9RZc03xfCP/FRwWgn6ASW4XkipEyM=; b=tJ+0gN21tmh0OXZS7hwyocwrTr
	yqn8X5lWoFoVV/qNjIOnHLXhUOgnVzq6aJqUO27NzUZ5SNlW/4xk/wL4Yw/TyUMuFYHybHhAavqVj
	6i4K3GN5vEb9FuYyj/vodAU0vZuqQYJiXSIFQQz81Jw9Pb89xf6402xAlMrV6UMY4SQeHlZAzC2/5
	fP+CNqSXODHtA/c5P5PtsQ+nSPiZSi9bux5u3iPosfVnVfsUdXEIZ/5jCkTnKclGLrnBjAXhXqcri
	1aM5t9DHbzXyQurg1Z/QGGXpLepFDUqbuwf2ScMysvcwRG4bPId1a+4AbybIbumtrbo/pwjd2aBiT
	Ogd7SHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbkk-000PDc-15;
	Tue, 04 Apr 2023 08:10:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjbh7-000OZE-2R
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 08:07:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96CD862FD0;
	Tue,  4 Apr 2023 08:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82385C433D2;
	Tue,  4 Apr 2023 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680595623;
	bh=5cJzvnfGpQRXqn/hReJhFCeYOI5sN4EzNm/zoSLcsfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vfw3dBNThRpSX1C+0bO/mc0Lqr5F4rrunUyEsnD5OCiwkoO9mrU9oNSpAMPLHpSsh
	 3EHNEwiF7bwBqOo0w+Eb/5hDHExXRZQBEKx0EHR8WZ/MIlyKOszXxY7ULvGHOfgCp9
	 LGXu+p5laKZ8xcbScaID9040v7o430llp1epdLC3trb9Elq93XY2UgwXeFMwBIL/7N
	 5sL3r5cPKzRN3gFq3xHuUa/5+RXyxE8gUwePOosWqIhQ/Miy8gl9NVorU4ZQNznl/+
	 WqxtD0VL/iv7e25zy9blIwTdiYgArZ/IVseNMqtO12MYZcg17p8UtXIXV3AtQm0ps6
	 MpPaOKO7f/HAA==
Date: Tue, 4 Apr 2023 10:06:59 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 net-next 02/10] net: ethernet: mtk_wed: move cpuboot
 in a dedicated dts node
Message-ID: <ZCvao0Me+W56aZpw@lore-desk>
References: <cover.1680268101.git.lorenzo@kernel.org>
 <56ed497762b1c031c553210a0e5c7717c6069642.1680268101.git.lorenzo@kernel.org>
 <10e9e8dd6eadf68eca55c5742adf18dad23661dc.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DjxG6hRSl/7US9il"
Content-Disposition: inline
In-Reply-To: <10e9e8dd6eadf68eca55c5742adf18dad23661dc.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_010739_114941_B4F9B468 
X-CRM114-Status: GOOD (  22.42  )
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


--DjxG6hRSl/7US9il
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 2023-03-31 at 15:12 +0200, Lorenzo Bianconi wrote:
> > Since the cpuboot memory region is not part of the RAM MT7986 SoC,
> > move cpuboot in a deidicated syscon node.
> > Keep backward-compatibility with older dts version where cpuboot was
> > defined as reserved-memory child node.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 34 +++++++++++++++++----
> >  drivers/net/ethernet/mediatek/mtk_wed_wo.h  |  3 +-
> >  2 files changed, 30 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/=
ethernet/mediatek/mtk_wed_mcu.c
> > index 6624f6d6abdd..797c3b412ab6 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> > @@ -18,12 +18,23 @@
> > =20
> >  static u32 wo_r32(struct mtk_wed_wo *wo, u32 reg)
> >  {
> > -	return readl(wo->boot.addr + reg);
> > +	u32 val;
> > +
> > +	if (!wo->boot_regmap)
> > +		return readl(wo->boot.addr + reg);
> > +
> > +	if (regmap_read(wo->boot_regmap, reg, &val))
> > +		val =3D ~0;
> > +
> > +	return val;
> >  }
> > =20
> >  static void wo_w32(struct mtk_wed_wo *wo, u32 reg, u32 val)
> >  {
> > -	writel(val, wo->boot.addr + reg);
> > +	if (wo->boot_regmap)
> > +		regmap_write(wo->boot_regmap, reg, val);
> > +	else
> > +		writel(val, wo->boot.addr + reg);
>=20
> Very minor nit: it would be more consistent with the read function
> above if you invert the 2 branches, e.g.:
>=20
> 	if (!wo->boot_regmap)
> 		writel(val, wo->boot.addr + reg);
> 	else
> 		regmap_write(wo->boot_regmap, reg, val);
>=20
> No need to repost just for the above, just take into consideration if a
> new version will be needed for other reasons (DT)

ack, will do.

Regards,
Lorenzo

>=20
> Cheers,
>=20
> Paolo
>=20

--DjxG6hRSl/7US9il
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZCvaowAKCRA6cBh0uS2t
rFWSAQCPmw8AG9PY1HwuQ+8YoFiZD7xMPuUISCtYUQDj+b2+EQD/UrRkEAwPhQ9A
3kwDl6KiG7HSunw03//xLB4ao5uZgQ0=
=e1qy
-----END PGP SIGNATURE-----

--DjxG6hRSl/7US9il--

