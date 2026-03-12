Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A017BFED2FF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 10:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WanIJb20YBScSjqXv3Cbi6XzodapZzgC/aG6n+eeCec=; b=Z+pErnDQGbZR8xsik41U4G9n0L
	K5Q0EBHcWw9MkugNpwJFORq4Wea5zHIoybWktf8+N7QGgZ4AtPT1hbQGC4Q6Xfqjpgrt9fB34x4Xd
	bUEoCHeEn/pVFnDMb3Yoy+FPa0dimH2fUngXRgkLFSIf/9wnb+JKvH599TkLe9CnWjGLDEzTGON59
	bvROpsSD/A+GV4nKrXEMxBPHtdzSLUo+r4LLop0I0peT640/zDREfWHq644O+kCwUTK/Kjsbjyuu+
	Gi24eDQYye22eY4669E7OgjhWGlvjvkx7XnPlN+uos8plAUec9RleHA7DoAgKXkJIXpE8gXg9RA0A
	TbJp/9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dbf-0000000DtdT-2lu0;
	Thu, 12 Mar 2026 10:49:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dbe-0000000Dtd4-0PZh
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 10:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92B5F43B9A;
	Thu, 12 Mar 2026 10:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7B7C4CEF7;
	Thu, 12 Mar 2026 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773312569;
	bh=K/Rm2ZVA9g3iMKUjwHXSc3uMxpSSU5EOmyzA01FNXaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RL43ccSTKwTRILCSL77fDKeqY4T4Y23LoLsFxjcyZiPyhW5k95AhPPQyUWzSogd0m
	 8XP+vO16IEpb1uyT6e4sGoO1MagSTcuXNBvMHhQ4elLjkQ/5Yx5KkP/wtj3hxGsIIN
	 S9rzgFP1uO9LEDK3Qhii1t2M6VGMCtrkBHxjfeIbkQQLUDpvBLpr9z0kuw/2feeRVV
	 TIp2Y9yechEuwRA0hfWBYKCBs33eWNlFoSR4c4IEaUXMNxaEjlNco5GNY7M2Qtt8RJ
	 d0UH5Sps+IoYfghQ0oQMJ1tLEo/rRN+Wb+qbHZat7Oi3G0gvfnc1phdOGcuObhpLPH
	 PsmqXGfA5PWrA==
Date: Thu, 12 Mar 2026 11:49:27 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Subject: Re: [PATCH mt76 5/6] wifi: mt76: mt7996: fix the temporary buffer
 for calibration-free data
Message-ID: <abKaN35p0J67rMOa@lore-desk>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
 <20260312095724.2117448-5-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JxkxFHsinZbtXUnl"
Content-Disposition: inline
In-Reply-To: <20260312095724.2117448-5-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_034930_178367_CA7BF579 
X-CRM114-Status: GOOD (  15.96  )
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


--JxkxFHsinZbtXUnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
>=20
> Move the declaration of buf[] outside the for loop.
>=20
> Fixes: 224c7c2be578 ("wifi: mt76: mt7996: apply calibration-free data fro=
m OTP")
> Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index 2a9c59d15894..4c733f51a03e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -4104,6 +4104,7 @@ mt7996_mcu_get_cal_free_data(struct mt7996_dev *dev)
>  	}
> =20
>  	for (band =3D 0; band < __MT_MAX_BAND; band++) {
> +		u8 buf[MT7996_EEPROM_BLOCK_SIZE];

why are you moving buf here? It is only used in the inner block.

>  		const struct cal_free_data *cal;
>  		u16 prev_block_idx =3D -1;
>  		u16 adie_base;
> @@ -4126,13 +4127,13 @@ mt7996_mcu_get_cal_free_data(struct mt7996_dev *d=
ev)
>  			u16 eep_offset =3D cal[i].eep_offs;
>  			u16 block_idx =3D adie_offset / MT7996_EEPROM_BLOCK_SIZE;
>  			u16 offset =3D adie_offset % MT7996_EEPROM_BLOCK_SIZE;
> -			u8 buf[MT7996_EEPROM_BLOCK_SIZE];

I think we should always define and initialize buf array here, otherwise we
could use it with uninitialized values. Something like:

			u8 buf[MT7996_EEPROM_BLOCK_SIZE] =3D {};

Regards,
Lorenzo

> =20
>  			if (is_mt7996(&dev->mt76) && band =3D=3D MT_BAND1 &&
>  			    dev->var.type =3D=3D MT7996_VAR_TYPE_444)
>  				eep_offset -=3D MT_EE_7977BN_OFFSET;
> =20
>  			if (prev_block_idx !=3D block_idx) {
> +				memset(buf, 0, sizeof(buf));
>  				ret =3D mt7996_mcu_get_eeprom(dev, adie_offset, buf,
>  							    MT7996_EEPROM_BLOCK_SIZE,
>  							    EEPROM_MODE_EFUSE);
> --=20
> 2.51.0
>=20

--JxkxFHsinZbtXUnl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabKaNwAKCRA6cBh0uS2t
rBXBAP9RSlH676VWo+h9+lFqvRDR9X/ZhMCTg1PuqU4AexZ4UgD+N5G8WvApvQ4G
lDp6fTNiXfp4rT3dP5XTb6mjdhTzIQc=
=zfPc
-----END PGP SIGNATURE-----

--JxkxFHsinZbtXUnl--

