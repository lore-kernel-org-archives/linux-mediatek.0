Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120CFC54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4o5oxyf1PRg0FdF9g6RRx/27QAYmxWt4Ic3flE1EdY=; b=cIqbnKU5AUSb6+zZgA0bW0JBZq
	Cc07f0O8HV8LdV+4YC8xPgP1E7EFjIJ9khgkpSrP56EZcxmF2amyWcadqk+g45VxnGsCUTJwaEhgZ
	0+43UvXRtgs2M11Nesy5Vu2/D8QVL7EOxtltj2/j+qu01FFto6AyAeTXgncwdYqN6pLqJM8lPrZpm
	tU2ZrOFTDmU84pbxPYlOFm8p4GnnL5H8BtI9DjKAqTwb3bQlYXDry9vBs72rN+ASgaQDEuaGMFuPK
	r1R7/75UyT1B1L2N0SB7PyPjQ71r6fxWxc/pZBiWL4+F0JvgQW1FjDzcEb4CKkzzyV0REs/LvsAnW
	8xW5SJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r50Ch-00BaY4-2E;
	Mon, 20 Nov 2023 09:04:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r50CW-00BaVt-0m
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 09:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5BD460FFF;
	Mon, 20 Nov 2023 09:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA5FC433C8;
	Mon, 20 Nov 2023 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700471053;
	bh=hot5sDVCzsRPH0e3Y2pQh0BXJobZ2r4KAF/Bw8Oaf5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B936dTkbFhA+GmiU/a37uc44KZTkMjCHD69bfAtxdPoZZe1iN4wFPBXotUTRZeiCe
	 uxNi3MvmpbWLCLAR2ks/c+brwOHGXZrBFX1skxuQS+4lN9LUl46HJIIICn+9hckRad
	 buqPBSA/yMM09WzRAVAMvlvI+nB/vzH08jiXNUpiDm+ggel4qmoonYAGKOYSOEFKhc
	 bHNjShvd6Mk19wW9nlqLugpeucGK+B2PRtbSC7rQOaBO1aUIGMHQwMqlJbt3KAIs/U
	 vMUf7g96lCwa8TWYHIh856s1luDdVz3BPTkbWyf9OOMwNKMuJvzlcUTuGU0xJbMnJC
	 ZuyiGaWdD8lDg==
Date: Mon, 20 Nov 2023 10:04:09 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, deren.wu@mediatek.com, Sean.Wang@mediatek.com,
	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com,
	robin.chiu@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com,
	Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] wifi: mt76: mt7921: fix country count limitation for
 CLC
Message-ID: <ZVshCS5T2EBCn1HH@lore-desk>
References: <20231120032750.19747-1-mingyen.hsieh@mediatek.com>
 <20231120032750.19747-2-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MMCwj60EzpBmdCna"
Content-Disposition: inline
In-Reply-To: <20231120032750.19747-2-mingyen.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_010416_400807_136ED30B 
X-CRM114-Status: GOOD (  18.34  )
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


--MMCwj60EzpBmdCna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>=20
> Due to the increase in the number of power tables on CLC, the variable
> nr_country is no longer sufficient to represent the total quantity.
> Therefore, we have switched to calculating the length of clc buf to
> obtain the correct power table. Additionally, the version number has
> been incremented to 1.
>=20
> Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Cont=
rol support")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 753a4fc45c70..e4edea1ab3dd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -1264,6 +1264,7 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8=
 *alpha2,
>  		u8 mtcl_conf;
>  		u8 rsvd[62];
>  	} __packed req =3D {
> +		.ver =3D 1,
>  		.idx =3D idx,
>  		.env =3D env_cap,
>  		.env_6g =3D dev->phy.power_type,
> @@ -1271,7 +1272,8 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8=
 *alpha2,
>  		.mtcl_conf =3D mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2),
>  	};
>  	int ret, valid_cnt =3D 0;
> -	u8 i, *pos;
> +	__le16 buf_len =3D 0;

I think here should be:
	u16 buf_len;

Regards,
Lorenzo

> +	u8 *pos;
> =20
>  	if (!clc)
>  		return 0;
> @@ -1281,12 +1283,15 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, =
u8 *alpha2,
>  	if (mt76_find_power_limits_node(&dev->mt76))
>  		req.cap |=3D CLC_CAP_DTS_EN;
> =20
> +	buf_len =3D le16_to_cpu(clc->len) - sizeof(*clc);
>  	pos =3D clc->data;
> -	for (i =3D 0; i < clc->nr_country; i++) {
> +	while (buf_len > 16) {
>  		struct mt7921_clc_rule *rule =3D (struct mt7921_clc_rule *)pos;
>  		u16 len =3D le16_to_cpu(rule->len);
> +		u16 offset =3D len + sizeof(*rule);
> =20
> -		pos +=3D len + sizeof(*rule);
> +		pos +=3D offset;
> +		buf_len -=3D offset;
>  		if (rule->alpha2[0] !=3D alpha2[0] ||
>  		    rule->alpha2[1] !=3D alpha2[1])
>  			continue;
> --=20
> 2.18.0
>=20

--MMCwj60EzpBmdCna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZVshCQAKCRA6cBh0uS2t
rIREAQD5H+ObbE8ZQzZx7NucAaG9CKKtB3ffJ+HYAsh3jyy3mwD/csi/JSC80R93
M4Cc4k16HlLewFDXfS34E8ILJNfmKQI=
=ex5T
-----END PGP SIGNATURE-----

--MMCwj60EzpBmdCna--

