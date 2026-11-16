Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56EF606A882
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CiGeKWEv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ai3CnFlU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZzeW4tTwnbgGY3PBdybZ0cug7ieSkJ3GuWfPIRIp3RY=; b=CiGeKWEvgYi5NPwrRw7QJxtHYf
	fNRTvrKeEP7tU3gNzAizuYfrcnwPZsd6AceZanHiWKKuveGjhYZqfqxa+g4/Deo1VBY8lGjBHCeG4
	Avs3CJih81qawZpCgKm1NxX3b3OGEcMd06CohsUtABBDkwhy3LhkBmcrCS7E6k+o8xyIB9zra9Rqr
	pJ6jrjLNtrIojNm9Nwj1QDE3pez5F639aycAwvaFCYyJLzCNQiAlNr8mqEbO5/fenLA4mFSnyEZpZ
	efNcxr39AbPVb1OjXcaGjZYAJjESfA5b5Dm9Yb60gnEac2z8pS4v+fJDy0PrapVH+QG4ghp2W/h/H
	35yxhS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsOR-00000001fYj-2GCm;
	Mon, 16 Nov 2026 08:48:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsOQ-00000001fXv-2QBt;
	Mon, 16 Nov 2026 08:48:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07C6E601DE;
	Mon, 16 Nov 2026 08:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FD41F000C4;
	Mon, 16 Nov 2026 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818929;
	bh=ZzeW4tTwnbgGY3PBdybZ0cug7ieSkJ3GuWfPIRIp3RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ai3CnFlU83nx4AAsDxjC5q1KuHfBmsyOSz73QjEyvNu3GwLEZIncbJKJelPJdEGUt
	 NnEcSlBR3hhLo9jBZbFv6x0byyjQdtZPsHLTrhX5K10mZfzLzhjEav1W+1R2O+vN+6
	 Nte4k56wgx07FxWWx9qrUv/u5JGkutGPByPZwr/oapMc41CNbenYuqR0P/V6JpDE2J
	 A8B77kN9BIV/RCWoYR/pbpY/znhnzKNkAt32Del0HvWHdvp0qtVdD2dK6hztizmrjL
	 3FZDg4zsW5XEPkNVuGUzD17QzFieXGhX1nHov8BFSrikogr/bBo7oXtQEjbfVmNV0N
	 qaqrySDq5X1uQ==
Date: Mon, 16 Nov 2026 09:48:47 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chad Monroe <chad@monroe.io>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Dylan Eskew <dylan.eskew@candelatech.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7996: check the RX WCID before using its
 station link
Message-ID: <avrDbwXDBCSbYcNx@lore-desk>
References: <20261115172723.34964-1-enderaoelyther@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4YCXUwoUCzBjd855"
Content-Disposition: inline
In-Reply-To: <20261115172723.34964-1-enderaoelyther@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--4YCXUwoUCzBjd855
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt7996_rx_get_wcid() returns NULL when the reported WLAN index does not
> map to a station entry on a valid band. Commit a3ea1c309bf3 ("wifi:
> mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO") made
> mt7996_reverse_frag0_hdr_trans() load msta_link->sta while declaring its
> locals, ahead of the !msta check that used to reject a NULL WCID. A
> header-translated first fragment without a station WCID now
> dereferences a NULL pointer in the receive path.
>=20
> Check the link before loading its station pointer.
>=20
> Found by code review and not reproduced; compile-tested only.
>=20
> AI assistance was used.
>=20
> Fixes: a3ea1c309bf3 ("wifi: mt76: mt7996: Fix mt7996_reverse_frag0_hdr_tr=
ans for MLO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index f36da545045b..186216f21d28 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -191,12 +191,12 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk=
_buff *skb, u16 hdr_gap)
>  	struct mt76_rx_status *status =3D (struct mt76_rx_status *)skb->cb;
>  	struct ethhdr *eth_hdr =3D (struct ethhdr *)(skb->data + hdr_gap);
>  	struct mt7996_sta_link *msta_link =3D (void *)status->wcid;
> -	struct mt7996_sta *msta =3D msta_link->sta;
>  	struct ieee80211_bss_conf *link_conf;
>  	__le32 *rxd =3D (__le32 *)skb->data;
>  	struct ieee80211_sta *sta;
>  	struct ieee80211_vif *vif;
>  	struct ieee80211_hdr hdr;
> +	struct mt7996_sta *msta;
>  	u16 frame_control;
> =20
>  	if (le32_get_bits(rxd[3], MT_RXD3_NORMAL_ADDR_TYPE) !=3D
> @@ -206,6 +206,10 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_=
buff *skb, u16 hdr_gap)
>  	if (!(le32_to_cpu(rxd[1]) & MT_RXD1_NORMAL_GROUP_4))
>  		return -EINVAL;
> =20
> +	if (!msta_link)
> +		return -EINVAL;
> +
> +	msta =3D msta_link->sta;
>  	if (!msta || !msta->vif)
>  		return -EINVAL;
> =20
>=20
> base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
> --=20
> 2.56.1
>=20

--4YCXUwoUCzBjd855
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavrDbwAKCRA6cBh0uS2t
rN4KAQDQDzGAyBaF5y4bcjJ0dGvBDNwOm0Mi5wrN3XoVmBAKJgEAgVXYPKx1jBy5
9Co9JCH5xt7OsmieVNb1RvSq2oW+yQA=
=ObA0
-----END PGP SIGNATURE-----

--4YCXUwoUCzBjd855--

