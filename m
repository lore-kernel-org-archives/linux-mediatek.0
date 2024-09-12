Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C065AEED606
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VapKBVO1UxAEWKdoyFAS1Jln8PtUY0+ZUTV+/wdSA/A=; b=vry1yC4yw8Shs1u6YRnkENC/tH
	jMXt+T9NhPEdALiqWGhQzkDGPh7QdoZLxCx2tC4aHYg5jVqtXpfIMa5b8h3hg1+EDc7/12ad/8Way
	q1Rb+sLQ5MAWjBkSM4Z7HGWtqk6+IRQB99ujF6X9mgqKAklYbcnkqwUCPS9z1gGBf4Pi7uz7WgnAp
	vM4VS86yWwZJz+RmVzqVTsnmcqfOC06EhdScyvCbeP7s0NQPUdHOOtSXmL5lzUaeJS9Y4tSMYYdog
	VMCr5xReuGV4b3ImWFkf94VkSve2jFVlEmtS5crDvIlFC+OngdqrgwRQPaZwBOrXrS8PVjNeRu/gT
	YXgvvBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sojyc-0000000DDoG-1aef;
	Thu, 12 Sep 2024 13:35:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sojxu-0000000DDhi-1Pbd
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 13:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D32F1A4048F;
	Thu, 12 Sep 2024 13:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9245C4CEC3;
	Thu, 12 Sep 2024 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726148069;
	bh=ZPGUs+XV1wH4pD/e24I0WI5X2rSL82Kr8LvctkIITlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqpCUvIUclq/pEm6mWt/GxP7ROVUs8USVr13+cWFUxvHbv0zPl0Uh5MTodxt7DPx/
	 ibKKHIh0Fnf6oeS11vDahbrvkMvIhkrRMK3KBlRSRvU4Rwf/MTEs4zwZBC8caxS0ot
	 zfsve/aHi4ihf8MnkyIEXrBuUg5S4dIqeQdlMUFwqEtwQjYxLRbxBPPOB5OJQTdaUy
	 JWcbBEmpz5s9PRgzBmI2vndvsPfn8O8ehono5shOwuAHiv/6KrTiP+X2ew/z57Ads+
	 eELANkgLsRBBlnBXBO3N/PPk9GfhCQEHrsciSq9Y1Qqe+tWSMlgODQp6E4ZgvgFL/v
	 U9NLu67gdBwzA==
Date: Thu, 12 Sep 2024 15:34:26 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: mingyen.hsieh@mediatek.com, nbd@nbd.name, deren.wu@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: Re: Is this a out-of-bounds issue?
Message-ID: <ZuLt4mJIKXldo9LH@lore-desk>
References: <66e2ec22.050a0220.37047b.174cSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zTcCE0kVxQc2thkN"
Content-Disposition: inline
In-Reply-To: <66e2ec22.050a0220.37047b.174cSMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_063430_523108_A8AE428E 
X-CRM114-Status: GOOD (  17.31  )
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


--zTcCE0kVxQc2thkN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> The code in drivers/net/wireless/mediatek/mt76/mt7925/mcu.c may have a
> out-of-bounds issue:
>=20
> 638         for (offset =3D 0; offset < len; offset +=3D le32_to_cpu(clc-=
>len)) {
> 639                 clc =3D (const struct mt7925_clc *)(clc_base + offset=
);
> 640
> 641                 if (clc->idx > ARRAY_SIZE(phy->clc)) <-
> 642                         break;
> 643
> 644                 /* do not init buf again if chip reset triggered */
> 645                 if (phy->clc[clc->idx])
> 646                         continue;
> 647
> 648                 phy->clc[clc->idx] =3D devm_kmemdup(mdev->dev, clc,
> 649                                                   le32_to_cpu(clc->le=
n),
> 650                                                   GFP_KERNEL);
> 651
> 652                 if (!phy->clc[clc->idx]) {
> 653                         ret =3D -ENOMEM;
> 654                         goto out;
> 655                 }
> 656         }
>=20
> Let's say the array size of "phy->clc" is 2, then the valid index is 0 an=
d 1.
> If "clc->idx" is 2, "clc->idx > ARRAY_SIZE(phy->clc)" must be false, the =
"break"
> statement won't be executed, and "phy->clc[2]" may access illegal memory =
address.
>=20
> So, should we modify the code like this?
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index 748ea6adbc6b..0c2a2337c313 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -638,7 +638,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, co=
nst char *fw_name)
>  	for (offset =3D 0; offset < len; offset +=3D le32_to_cpu(clc->len)) {
>  		clc =3D (const struct mt7925_clc *)(clc_base + offset);
> =20
> -		if (clc->idx > ARRAY_SIZE(phy->clc))
> +		if (clc->idx >=3D ARRAY_SIZE(phy->clc))
>  			break;
> =20
>  		/* do not init buf again if chip reset triggered */
>=20
> --=20
> Best,
> Qianqiang Li=20
>=20

Hi,

I think this is already fixed here:
https://patchwork.kernel.org/project/linux-wireless/patch/84bf5dd2-2fe3-441=
0-a7af-ae841e41082a@stanley.mountain/

Regards,
Lornzo

--zTcCE0kVxQc2thkN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZuLt4gAKCRA6cBh0uS2t
rKewAP9Bk0Kx298gaUBbBxDdidN4NTL4HS7HYyk+z3/vaHqulQEAx15UgXPDfvMg
YXUd0YI2WZHcm88Ils0GXKUWHf7+Qgc=
=XjbQ
-----END PGP SIGNATURE-----

--zTcCE0kVxQc2thkN--

