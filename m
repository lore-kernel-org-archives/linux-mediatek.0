Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C452FEA833
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNL2dAJR9wpKEGur/XsVfteVgomU1FOrpOss8EPJ5H4=; b=zn4ofmEoPVYqM8pHI8KvjIJJgr
	bFDYSWGp31t2RINc4QG8wa6Xci5N8uO646vkUEfwdq95NXSBGEp02F0MhQq1WxQzsBX9aKObr0U6p
	ahjgowL6izv7aVQQ9fYwortyaXJErvKwZb+BRxTsudHJKsINkOMozQkcY5wxxI9ovQS37AGeu/WmY
	bmYYJktxlgKLQgrGgOtEPrivgC0i5F4ZQDQKYAbwENgoL39AJW0BcD2cE3VMSuvAV7iFbQKl8ktDk
	zBOA1runz3kQ1n6sEXm2X50ffyeFY/WsI7RR/bTVtAHBfpqJC8HB5AdAZpTaxeGA8IBjY4/v3RFp8
	vnysaaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jkr-00000002xsk-3vrp;
	Wed, 25 Mar 2026 08:38:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jkq-00000002xsa-1Ria
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 08:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EEB0600AC;
	Wed, 25 Mar 2026 08:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C36C4CEF7;
	Wed, 25 Mar 2026 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774427899;
	bh=EM0+9tNtdiTwGPX1mNsPTcVBTrSGR7FlxukO3n8bNS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCcXmIllWZeKF1/Z/hVrl9NVmEqKjENo7m3QZFAXIuKBxcOEe/OQ/JHJeXIHJ/CdK
	 uKairazOIxLS/qTL9BZRWoDVBY4YK1z3t2IRAYxh6LzbujIZ7sStEMj8v4/uypm4mr
	 lmmHNt8H5sEm6jOy5fGNGLddtIvnzk85jab/IFKMcbsu2QgDInKOe50E/SMTOgNIzb
	 krYN5rH8CftJfk7zzu6SX7juTi/nmEdvXy11FZSJG9KfkO0QiRyU6ilVZKCrtP56GT
	 Hil9OLOiG30pP5LEo3nSjPesbe7vh+Bg1ANS9SWiR4gkRQ9Sh+qYEG+FscxJnCuWze
	 Wrr3adCiENsOw==
Date: Wed, 25 Mar 2026 08:58:40 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: disable UNI_BSS_INFO_PROTECT_INFO
 for mt7996
Message-ID: <acOVsMnd_UQtS8h7@lore-rh-laptop>
References: <a1f5ad05b164c836161e9c53e32335c15a1fa2a2.1774411028.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ZliJ2s3U8pZrCt9"
Content-Disposition: inline
In-Reply-To: <a1f5ad05b164c836161e9c53e32335c15a1fa2a2.1774411028.git.ryder.lee@mediatek.com>
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


--7ZliJ2s3U8pZrCt9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> There are known firmware issues with MT7996, so it is temporarily
> disabled. MT7992 and MT7990 are working normally.
>=20
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mcu.c
> index 16420375112d..bdc40e94127c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -1281,6 +1281,9 @@ int mt7996_mcu_set_protection(struct mt7996_phy *ph=
y, struct mt7996_vif_link *li
>  		PROT_NONGF_STA	 =3D BIT(7),
>  	};
> =20
> +	if (is_mt7996(&dev->mt76))
> +		return 0;

Hi Ryder,

nit: can you please add a comment here describing why this is required? Tha=
nks.

Regard,
Lorenzo

> +
>  	skb =3D __mt7996_mcu_alloc_bss_req(&dev->mt76, &link->mt76,
>  					 MT7996_BSS_UPDATE_MAX_SIZE);
>  	if (IS_ERR(skb))
> --=20
> 2.45.2
>=20
>=20

--7ZliJ2s3U8pZrCt9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCacOVrgAKCRA6cBh0uS2t
rEEVAP46LkzCPwGF5e7kcW9FgtIk0MGvoM2dJPMHJ+w3b1d1yQD/eS7eMXImJkwA
GE6L/r5/7ZT5m7nI6geFnkq1BZ/tQwQ=
=EeR4
-----END PGP SIGNATURE-----

--7ZliJ2s3U8pZrCt9--

