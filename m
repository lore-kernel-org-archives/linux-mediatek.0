Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86A0C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjTVpshr1nz2jFJoCMTLYbynj0cJ7qLjQ5rtWVDunuU=; b=mcq5ACsFhX1dhxmaTuxfS2jYRw
	LX0IpGPBQKkMCSwVdQJYfUXDh2GFfZcVvsw5PzddiOhy0tlWplpEasO0acZ7c5wAHZMF/Kibs6QKJ
	st0Kf8wiUBL3Z77NiZ09DnPwrA0ycYz1WrZmergEYS4jxU6MF9sfI3xctzyxSmhtoNXmErLR/aogM
	vTjco/R890Bx9n0SllCJ2WYRQ/V4kmgTljV6yJ/hIA/qEYDkMAiYJ+7aNVqSS8pZX/t/q1NAY50t7
	Tl0bI/7CcoQ9E/Y6ceD++POb6+JyVjpRvir79H3bN24YzoKGBRJI7AyfPRMUvH2fMwTXsYZmCdtKS
	4Jn8wSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBkj-00000004GAN-1LJQ;
	Thu, 07 Mar 2024 11:17:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riBkg-00000004G9m-0SIo
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 11:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F09461BD6;
	Thu,  7 Mar 2024 11:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEAEC433F1;
	Thu,  7 Mar 2024 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709810249;
	bh=noVrTzADk5MLxl13sgvJBZuvtxPbZk2va39CKN/RpZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/oo9gHklGo8uO05iepe8rNIEo6T8MNgguU6igYntI+hs5KIYx9/NFYq36wjUQ/W3
	 Hw5cG941fglskyhsbU3QyiQ0qBeuM4Jy3/lhLV1uR8QfaSBlSP0Qug1L71FT+H32Ow
	 x9Ym3YMZtpaBxhf5tgHHdn94An3bCVQyyyrrvWxuCVnHhG/ku8AsLhA8I9I259nn2o
	 6szOK62LOn0avmXglumCSJvfL960Q2K0Vv6MNohr8mZTVjArRG1icYodwsTDH9qzeI
	 HoqR+dZVsfm4y6cp2YO8RtutMI+NCiH8wB7cX2qcfIHd2DGKndgQt+XsaGXi72/2fD
	 pks4VSPTaGdmA==
Date: Thu, 7 Mar 2024 12:17:25 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, deren.wu@mediatek.com, Sean.Wang@mediatek.com,
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com,
	robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7925: ensure 4-byte alignment for suspend
 & wow command
Message-ID: <ZemiRaRNhNTn-XLb@lore-desk>
References: <20240307110815.527-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hPK9O+BSXO6lyn26"
Content-Disposition: inline
In-Reply-To: <20240307110815.527-1-mingyen.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_031730_219814_749FF241 
X-CRM114-Status: GOOD (  14.20  )
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


--hPK9O+BSXO6lyn26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>=20
> Before sending suspend & wow command to FW, its length should be
> 4-bytes alignd.
>=20
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 1 +
>  drivers/net/wireless/mediatek/mt76/mt7925/mcu.h      | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index af0c2b2aacb0..ef29d093f9c3 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -2527,6 +2527,7 @@ int mt76_connac_mcu_set_hif_suspend(struct mt76_dev=
 *dev, bool suspend)
>  			__le16 tag;
>  			__le16 len;
>  			u8 suspend;
> +			u8 pad[7];

mt76_connac_mcu_set_hif_suspend() is used even by other drv (e.g. mt7615). =
Is
this change backward compatible?

Regards,
Lorenzo

>  		} __packed hif_suspend;
>  	} req =3D {
>  		.hif_suspend =3D {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.h
> index 2a0bbfe7bfa5..b8315a89f4a9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> @@ -535,7 +535,7 @@ struct mt7925_wow_pattern_tlv {
>  	u8 offset;
>  	u8 mask[MT76_CONNAC_WOW_MASK_MAX_LEN];
>  	u8 pattern[MT76_CONNAC_WOW_PATTEN_MAX_LEN];
> -	u8 rsv[4];
> +	u8 rsv[7];
>  } __packed;
> =20
>  static inline enum connac3_mcu_cipher_type
> --=20
> 2.18.0
>=20

--hPK9O+BSXO6lyn26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZemiRQAKCRA6cBh0uS2t
rC3TAQD2nyW0jjKsA5ibpFk88RbBGpFj7M5IY6YKAUfYccBL7QEA+ACex8pWuzKC
NG0ubBBlrg29kthxg6x65IyMhkSwHQY=
=VuWY
-----END PGP SIGNATURE-----

--hPK9O+BSXO6lyn26--

