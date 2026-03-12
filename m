Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E74103E301
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 10:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6q/fSIHGHCAw6mifvWZEy7qrMwfalQA6mUljDnCgszU=; b=13FWjpBWQwlOYUZSTmCriE14U9
	ildLjga3SXw62emB3kbxSG+a9JbQueRGa9TU68v4bRNFWsa04IBJk6wvDLgAgEqeObfgvi7xu/U7i
	XFVsIDMT2dmhOneMVOgEptwcKG3q9TxDeQi2uET52X/+icRpWgRBPs19Flo9Cazwz76qCQvvyyyGO
	8Up96f5TZyE2dGaqzBxa1yLfWCxSQvakTvYFjqklEB5U3EZqm6UEd2lC+xSJIjtq/t+TwLBn7OfgW
	nUllbhFEG0QmyKNWl4MV1WgCG9UhzI4zRmbVb5e1LitiXRvdeWSe3ZLMavaNT9tu7X3osCP/vVNSo
	94syGpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dUm-0000000Dsyd-3rkN;
	Thu, 12 Mar 2026 10:42:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dUl-0000000DsyW-0xlZ
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 10:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52CA960142;
	Thu, 12 Mar 2026 10:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81190C4CEF7;
	Thu, 12 Mar 2026 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773312142;
	bh=x+Z87COydW0vfSd3sCt8LrQRlMS5+NrVWrjuiYAwD3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ag7yXeVEPkPXY/yDQjyY5arpTeTGF+4qF8GyzKQ7jN2eGxmEloGeg9Ch668jA1vkY
	 Jmyn6RVVeZT4cxwxgpyi6Z+Jq1bOMCg+pQi89Qc99Wiv8/jFg4dD5rOkDwFkcFLwmX
	 11t2liuE/TzycprCV5GOoIZIKO1MdboMgc9+DnOTo/JLfpkK6egpXD+tz8I6qjQp07
	 Dtn/9MOxVkSKsvyoFq6cyuUKcnG/FEkUsDdkNe4aKnS8aOU1RzzqlSyZH9i5KzJt6b
	 aTSnK1JsrAZzZEAS0j3rXgcaUeoUUtie5BDOugmnTMqSgigJfRLlY8PHXnicbvbZCZ
	 cAHJ1hUQaLZRg==
Date: Thu, 12 Mar 2026 11:42:19 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: Re: [PATCH mt76 2/6] wifi: mt76: mt7996: support critical packet
 mode for MT7990 chipsets
Message-ID: <abKYixEiPYe3ot_e@lore-desk>
References: <20260312095724.2117448-1-shayne.chen@mediatek.com>
 <20260312095724.2117448-2-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rrv6gaOSBsh/EhZm"
Content-Disposition: inline
In-Reply-To: <20260312095724.2117448-2-shayne.chen@mediatek.com>
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


--Rrv6gaOSBsh/EhZm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Howard Hsu <howard-yh.hsu@mediatek.com>
>=20
> For MT7990 chipsets, critical packet mode must be enabled. Without this,
> some higher priority packets may be placed in the wrong AC queue.
>=20
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

I guess we are missing a Fixes tag here.

Regards,
Lorenzo

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7996/main.c
> index e1e51c9a0767..d286dedddd9b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
> @@ -56,7 +56,7 @@ static int mt7996_start(struct ieee80211_hw *hw)
> =20
>  	mutex_lock(&dev->mt76.mutex);
>  	ret =3D mt7996_mcu_set_hdr_trans(dev, true);
> -	if (!ret && is_mt7992(&dev->mt76)) {
> +	if (!ret && !is_mt7996(&dev->mt76)) {
>  		u8 queue =3D mt76_connac_lmac_mapping(IEEE80211_AC_VI);
> =20
>  		ret =3D mt7996_mcu_cp_support(dev, queue);
> --=20
> 2.51.0
>=20

--Rrv6gaOSBsh/EhZm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabKYiwAKCRA6cBh0uS2t
rOfgAPwPIPo6e4qxhCA2xPzKtm2uTWNVR39oqd4w0vU7DMfMbwEA26unZoPslPmO
IfxtYo7z/T50bc138ukVlD5S9TgH3gg=
=6pIp
-----END PGP SIGNATURE-----

--Rrv6gaOSBsh/EhZm--

