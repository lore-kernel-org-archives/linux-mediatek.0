Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB957D3B7F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPhKaRJdxafq/QKZpQBH7bxbR+1uB8M9QAxtyYTbMGM=; b=LiHdklt5wmQQOA7xW1OUuXHd+Y
	ZQF/JpjkIXbDLPbvz21hS6dxq84tgtcB83PcHLPCcjYyVJU8aDhSOmVxJUvcFJOgXrn8BijvsyfWw
	z1soCU3ArSsftheSuzoDXP6liFp5tLLb186rERBj7YrjS4ff+WYNAPXTgVjK73z2ReSbWTyio3L/8
	fcv7DJ7zju5T7rWw8nlzKn7lHcSZrK9Fe35srUWFz2h56RkWqCEH0RyatlsTMz1MpndxaEqyEn1Kt
	X/+8ueKz/QFWDvl55XOHbSpJsSDRVyCOnrt0BveCgGRvMQ6jB+0lziVN8fRedOP0kmmGw1a8lYoOy
	+E/XK2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc5V-0000000DAty-0COX;
	Mon, 08 Dec 2025 14:19:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc5T-0000000DAtq-2JSi
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 14:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6BD460172;
	Mon,  8 Dec 2025 14:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF226C4CEF1;
	Mon,  8 Dec 2025 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765203578;
	bh=vC4ZLDTOkG6dsh62qPT9eyeu/t9BABENkfkivMFbs88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgBoVz7FwY3umYMF1PV4DvUgxrFkznPJynYuzD9CLq/lJmTvCWdYdAB+WSJPoMFBf
	 tj60zu7fkalhoeIGv/H6QRsuBkVHLV9+/jX/s2yPRUBUETtVHXAhgtnMpb/QYTJpPJ
	 WzeEwRQHhMt7EfNjpXdIBAqomIrxUB64uMPJL5gOUnc281U2TycXr6o4U59pPv0TOi
	 rNH6NxU/FOBFa82Qwh1iMhf70CA+4XJV9d9Ijxw7/92kyq+8iiCUEUEAgPI72ahrVf
	 3gToh4Aj4FRKeIqnAMDVyv0ZPERsc/j175JYMcRr735PHQpKYACrxR/5UhBBoZh5Ql
	 7bzmDmJ9PMYaQ==
Date: Mon, 8 Dec 2025 15:19:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Chad Monroe <chad@monroe.io>
Cc: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>,
	Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: fix deadlock in remain-on-channel
Message-ID: <aTbed-BC8vEmwpzD@lore-desk>
References: <3fceebb12dcb672cfae11f993a373b457a35e228.1765198130.git.chad@monroe.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7le5LWZSIXz4geqy"
Content-Disposition: inline
In-Reply-To: <3fceebb12dcb672cfae11f993a373b457a35e228.1765198130.git.chad@monroe.io>
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


--7le5LWZSIXz4geqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt76_remain_on_channel() and mt76_roc_complete() call mt76_set_channel()
> while already holding dev->mutex. Since mt76_set_channel() also acquires
> dev->mutex, this results in a deadlock.
>=20
> Use __mt76_set_channel() instead of mt76_set_channel().
> Add cancel_delayed_work_sync() for mac_work before acquiring the mutex
> in mt76_remain_on_channel() to prevent a secondary deadlock with the
> mac_work workqueue.

I think we need a Fixes tag here.

Regards,
Lorenzo

>=20
> Signed-off-by: Chad Monroe <chad@monroe.io>
> ---
>  drivers/net/wireless/mediatek/mt76/channel.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/w=
ireless/mediatek/mt76/channel.c
> index 2b705bdb7993..d9f8529db7ed 100644
> --- a/drivers/net/wireless/mediatek/mt76/channel.c
> +++ b/drivers/net/wireless/mediatek/mt76/channel.c
> @@ -326,7 +326,7 @@ void mt76_roc_complete(struct mt76_phy *phy)
>  		mlink->mvif->roc_phy =3D NULL;
>  	if (phy->main_chandef.chan &&
>  	    !test_bit(MT76_MCU_RESET, &dev->phy.state))
> -		mt76_set_channel(phy, &phy->main_chandef, false);
> +		__mt76_set_channel(phy, &phy->main_chandef, false);
>  	mt76_put_vif_phy_link(phy, phy->roc_vif, phy->roc_link);
>  	phy->roc_vif =3D NULL;
>  	phy->roc_link =3D NULL;
> @@ -370,6 +370,8 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, s=
truct ieee80211_vif *vif,
>  	if (!phy)
>  		return -EINVAL;
> =20
> +	cancel_delayed_work_sync(&phy->mac_work);
> +
>  	mutex_lock(&dev->mutex);
> =20
>  	if (phy->roc_vif || dev->scan.phy =3D=3D phy ||
> @@ -388,7 +390,14 @@ int mt76_remain_on_channel(struct ieee80211_hw *hw, =
struct ieee80211_vif *vif,
>  	phy->roc_vif =3D vif;
>  	phy->roc_link =3D mlink;
>  	cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_HT20);
> -	mt76_set_channel(phy, &chandef, true);
> +	ret =3D __mt76_set_channel(phy, &chandef, true);
> +	if (ret) {
> +		mlink->mvif->roc_phy =3D NULL;
> +		phy->roc_vif =3D NULL;
> +		phy->roc_link =3D NULL;
> +		mt76_put_vif_phy_link(phy, vif, mlink);
> +		goto out;
> +	}
>  	ieee80211_ready_on_channel(hw);
>  	ieee80211_queue_delayed_work(phy->hw, &phy->roc_work,
>  				     msecs_to_jiffies(duration));
> --=20
> 2.47.3
>=20
>=20
>=20

--7le5LWZSIXz4geqy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaTbedwAKCRA6cBh0uS2t
rPnbAQCQLkt1ogkYrYOvbFfy7fnwAMGuqg8FvgG+qKg9LpuSMgD/dIWDKL8FZ3tI
ishi71jr9T+1xXEqsLCGivoIsl/zowc=
=x/pD
-----END PGP SIGNATURE-----

--7le5LWZSIXz4geqy--

