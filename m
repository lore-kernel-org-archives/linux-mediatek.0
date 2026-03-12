Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46990103E302
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pE3EjHNs/NGCFIljMEcWvLmm3D6h/8kY4nU73OZeR58=; b=tjmxsYPKW9R7ylLN6jW8f+MWxT
	VgBBXv39N8f7UKJu9bhJBjT7L4aU6l2k+M4sSkncYAR/J6cZthWWQZuLiaNMAFf3HKdn7Vl2s8dLh
	DB5EgD2CnbitWZIjL5MnU6U0bVEkYayfBy4p3o9vVcx6Rc/VmG2M5Hwfx7++Y7PZUZnwbVO3e16Av
	ll3Lfa5DCDf+eAt0yis/aR4A5l1Zaw2Xs+Oan99/g+q9Cfv6vhaXuO8NcG2WEFkk5u0t74+lHouje
	XOeD/8M2SP/Q0fZeg9IVpt/5y4ZUUhNqQz47z4I90CrxKWa4dpmoa1KE/pc52QwE4t/q/uu6k6Vhw
	woFzbF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSY-0000000Dskg-2Ckg;
	Thu, 12 Mar 2026 10:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSV-0000000DskM-11r2
	for linux-mediatek@bombadil.infradead.org;
	Thu, 12 Mar 2026 10:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pE3EjHNs/NGCFIljMEcWvLmm3D6h/8kY4nU73OZeR58=; b=nQRKDYvY+/smHbKXFTjdewsuXW
	7BomNMo83d5rHk7D79STdhRrbZ2X95b4gGd0BU/x05ObKZvc0kecGafC1drSK7hjR71nGOYC4bGTY
	HneIZ94okz3py5A3u8VuyywTG2mdh4ONXkzytQtPwE0ZALZyS7s2jyKBRfS7qRm5zJip002dXj+xl
	YbmxE6rrMSfyOATI6W3F2dF7YhDX66SHeUnGB3DMNJg9XQTtrQp1tUG1sm02A2GjkuU4Ayj8O08Uf
	wiqaprIr9f/1+pBBJvY6o5qMs7uUVEOXeoXEa9znVdXGCJJu57AGgZxs9u8ujmus/vM6Cdxlsx0Q9
	65qgpGsA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSS-00000000web-0kXG
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 10:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81E774194F;
	Thu, 12 Mar 2026 10:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59C5C4CEF7;
	Thu, 12 Mar 2026 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773311996;
	bh=pDVbEPackjHOkDSkszUjMWANS+pLeXpAW11n0EUfPZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmjorNFECXNJEhIvMFPJMesvdQV53BZgUT9zKAHZH7ebZHaOxKcNRswBeoUjH2k73
	 E631tm6hRN3pWxf5kKU4+AqhISKwMz24d93WPDRAHeM18j8pZlIlkXQc4GecTpe5xR
	 gqipAG4U7ITlClII9Er+976ctAYk/A2PoK9ID6uVybupVDeRgRXDbH0xRNJAYyIXiA
	 XL2iHnrzvK3KCC4in6oL3QxN3FRv6FJdMdvTwrDDj5X+3t0AbHGJJor4bSP2z/Dzim
	 6GfEIY+RZCxDEGAspRxpnTzfKyAPtK/jajLG29R0DzPiwGguaZW8P+RSKIRpMnh7d4
	 SN3xXVg5Ny23g==
Date: Thu, 12 Mar 2026 11:39:53 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: Re: [PATCH mt76 1/6] wifi: mt76: mt7996: fix RRO EMU configuration
Message-ID: <abKX-Zzn12F11L9D@lore-desk>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iguTs+hpi+rd15oI"
Content-Disposition: inline
In-Reply-To: <20260312095724.2117448-1-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_104000_659042_3639553A 
X-CRM114-Status: GOOD (  14.59  )
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


--iguTs+hpi+rd15oI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Peter Chiu <chui-hao.chiu@mediatek.com>
>=20
> Use the correct helper to update specific bitfields instead of
> overwriting the entire register.
>=20
> Fixes: eedb427eb260 ("wifi: mt76: mt7996: Enable HW RRO for MT7992 chipse=
t")
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/init.c | 3 +--
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/init.c
> index 5aaa93767109..f3239f530aea 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
> @@ -873,8 +873,7 @@ void mt7996_rro_hw_init(struct mt7996_dev *dev)
>  			}
>  		} else {
>  			/* set emul 3.0 function */
> -			mt76_wr(dev, MT_RRO_3_0_EMU_CONF,
> -				MT_RRO_3_0_EMU_CONF_EN_MASK);
> +			mt76_set(dev, MT_RRO_3_0_EMU_CONF, MT_RRO_3_0_EMU_CONF_EN_MASK);
> =20
>  			mt76_wr(dev, MT_RRO_ADDR_ARRAY_BASE0,
>  				dev->wed_rro.addr_elem[0].phy_addr);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index a415cc610eee..86aaf0f29e28 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -2559,7 +2559,7 @@ void mt7996_mac_reset_work(struct work_struct *work)
>  	mt7996_dma_start(dev, false, false);
> =20
>  	if (!is_mt7996(&dev->mt76) && dev->mt76.hwrro_mode =3D=3D MT76_HWRRO_V3)
> -		mt76_wr(dev, MT_RRO_3_0_EMU_CONF, MT_RRO_3_0_EMU_CONF_EN_MASK);
> +		mt76_set(dev, MT_RRO_3_0_EMU_CONF, MT_RRO_3_0_EMU_CONF_EN_MASK);
> =20
>  	if (mtk_wed_device_active(&dev->mt76.mmio.wed)) {
>  		u32 wed_irq_mask =3D MT_INT_TX_DONE_BAND2 |
> --=20
> 2.51.0
>=20

--iguTs+hpi+rd15oI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabKX+QAKCRA6cBh0uS2t
rIx5AP0dKoujlT6i8aItT2p8vcGNJ/KD6Gf6Zvu4+zxi7rYu5wEAghyiR8aWNO46
mhR6BaScV2AVgazIBnR5cgjD2XmMWAQ=
=SIDW
-----END PGP SIGNATURE-----

--iguTs+hpi+rd15oI--

