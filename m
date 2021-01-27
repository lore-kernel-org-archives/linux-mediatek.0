Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA39C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 13:01:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68EF120853
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 13:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68EF120853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2DkYZTqh8tIJq0YiIJp4Ls0ut8jrf2S/jD2xenNLROQ=; b=0JyckE7D2qSwhuXuiFoE954eU
	R9rrlwRT2Vzt8VHbtj574zu4oEsGid3uYwAy67pkbuhwoHiSywQtq/crEqT22SoWIxoFmRx6nOd50
	qA3MUaIaw/Kky0g2PN1dNKnI+aoQ/QW6GkIej5ZjQVLUk/b8CeCkHCG79J2lGVF7+GXXXEm71Y8fL
	krHJN0u9N4hnYlJcKj1Kg2U9hIi1ZCdcD9vtZuB1pW0pK8qiPrI7rQjH8nhXVFuLVdOHNguIjqS2X
	pBrQUpPjY2Y+WWqsVgHOqG+lwNBawZdyrO8Vjn2HOgBub7UkzaWkT35XpVSnm8baq79msmJ2BD9s1
	YfUwgjdoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4kRU-00046Z-TY; Wed, 27 Jan 2021 13:01:04 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4kRJ-00041m-Fc; Wed, 27 Jan 2021 13:00:55 +0000
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9A2151C000A;
 Wed, 27 Jan 2021 13:00:40 +0000 (UTC)
Date: Wed, 27 Jan 2021 14:00:39 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2] of/device: Update dma_range_map only when dev has
 valid dma-ranges
Message-ID: <YBFj9whLvqlV2erm@aptenodytes>
References: <20210119105203.15530-1-yong.wu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210119105203.15530-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_080053_828908_3DF7F671 
X-CRM114-Status: GOOD (  22.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6210367405646461438=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6210367405646461438==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BIH3KrdpdMNN62Ds"
Content-Disposition: inline


--BIH3KrdpdMNN62Ds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 19 Jan 21, 18:52, Yong Wu wrote:
> The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
> supplanting dma_pfn_offset") always update dma_range_map even though it w=
as
> already set, like in the sunxi_mbus driver. the issue is reported at [1].
> This patch avoid this(Updating it only when dev has valid dma-ranges).
>=20
> Meanwhile, dma_range_map contains the devices' dma_ranges information,
> This patch moves dma_range_map before of_iommu_configure. The iommu
> driver may need to know the dma_address requirements of its iommu
> consumer devices.

Just a gentle ping on this issue, it would be nice to have this fix merged
ASAP, in the next RC :)

Cheers,

Paul

> [1] https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be09=
7c7ceb32@arm.com/
>=20
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Frank Rowand <frowand.list@gmail.com>
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting d=
ma_pfn_offset"),
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/device.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index aedfaaafd3e7..1122daa8e273 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -162,9 +162,11 @@ int of_dma_configure_id(struct device *dev, struct d=
evice_node *np,
>  	mask =3D DMA_BIT_MASK(ilog2(end) + 1);
>  	dev->coherent_dma_mask &=3D mask;
>  	*dev->dma_mask &=3D mask;
> -	/* ...but only set bus limit if we found valid dma-ranges earlier */
> -	if (!ret)
> +	/* ...but only set bus limit and range map if we found valid dma-ranges=
 earlier */
> +	if (!ret) {
>  		dev->bus_dma_limit =3D end;
> +		dev->dma_range_map =3D map;
> +	}
> =20
>  	coherent =3D of_dma_is_coherent(np);
>  	dev_dbg(dev, "device is%sdma coherent\n",
> @@ -172,6 +174,9 @@ int of_dma_configure_id(struct device *dev, struct de=
vice_node *np,
> =20
>  	iommu =3D of_iommu_configure(dev, np, id);
>  	if (PTR_ERR(iommu) =3D=3D -EPROBE_DEFER) {
> +		/* Don't touch range map if it wasn't set from a valid dma-ranges */
> +		if (!ret)
> +			dev->dma_range_map =3D NULL;
>  		kfree(map);
>  		return -EPROBE_DEFER;
>  	}
> @@ -181,7 +186,6 @@ int of_dma_configure_id(struct device *dev, struct de=
vice_node *np,
> =20
>  	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> =20
> -	dev->dma_range_map =3D map;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> --=20
> 2.18.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--BIH3KrdpdMNN62Ds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmARY/cACgkQ3cLmz3+f
v9HHbgf/Rk9Hu0kUW5B3MNVJs1JlKh376ihTjnZEjV3Xo7c4YP4KwGcTzAB2AMY2
ja2o4bLiLOBTOVExH1kXCmXuxvlgvumq3H9Zxi0+Ef/5ZPPlmi915WuSw440Seg3
t3W638nzVrqrIcvKa6YiS41UV5CbYGKHhBiInpPDdK3FbSDzRMSFkr3EKFdhNK1F
qgL/9PV6WpamufJW589cWXQFumazQN/kz+zop1kD0jqWbNiSKM4rNz5j4PvH5iwj
uQFWwUF/nuPfiEMCTeICiFrtgMTpl6QqiZqAUenTk+wuPeB7Xk0mXg0kaFmeUYpX
k9INUJJAqUv96+i8ZW2lfOnI7fo90g==
=2oxl
-----END PGP SIGNATURE-----

--BIH3KrdpdMNN62Ds--


--===============6210367405646461438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6210367405646461438==--

