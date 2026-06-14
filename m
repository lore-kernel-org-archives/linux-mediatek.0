Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5BDCD98D2
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqHEqZNJNsjZK9I6sk+rqbOvQVikyDhgsbDLwNY1Oz0=; b=WCSIzXCfhMsxXjQuH4kkCJ5J/r
	imMrBGSYfpSrdeqCzWJVK4g4iFtkWS756LxTsEturtpkFttQi/oaE5g5ZiYFvIh5MeE8XqaVuUt6e
	rOXttuC6qntKKHz442Ja8Lfvc0KKA6pLNRcMI1x22h7NXEV3XykU1DbWJ2AKE7FwwsfBDu+IkvReu
	mrJV9uNM+rpahaiUfsvS2VmgXM3d8HNsSwZrINABb4TIzBZL925AC4zxfDQeY8gsi6olzGLF8sfhk
	VTy6pHehE2lPrvGbdqrwfz13aaroSWqeL3t08HgVedmsJoRaRIy/E1s3TWtRNNpvQEkSYjuhYybTO
	L8A5nAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYh95-0000000CqDb-3V8c;
	Sun, 14 Jun 2026 09:28:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYh94-0000000CqDR-24FD
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 09:28:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CD01400C8;
	Sun, 14 Jun 2026 09:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944C81F000E9;
	Sun, 14 Jun 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781429326;
	bh=qqHEqZNJNsjZK9I6sk+rqbOvQVikyDhgsbDLwNY1Oz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mv+DF5rOTEgmQYVWkV9d43nvbJDKv1wPLcVCUhiFkcxOuZf1hTlXa+7sNy9fpB2+O
	 cpMinbgi+Pqt6mNbG7V0VD125vFvScUK0ok1Tu4RKF5UyR/cEglwbl8odJ2COaaiJR
	 onrFuuFXN4hfawkVFiyvrbXv+LdosY1MMPldpVjvWYY9wYMqoAghkMlwtHeeeQJhVh
	 zlR+W4nyBy5ZsphzvROBvoxbXpgRCqoGP1MuI7H5PXvl81KIosT4ztF2ebNZ1g4KKj
	 GOGFKTBjCjEYlL5Z4nOVuwOD7xVtWFaPgrfLc1JOufYjqGceMBCjYJicg0MZy5Ktqz
	 fMM6KURRPoW3A==
Date: Sun, 14 Jun 2026 11:28:43 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 1/5] wifi: mt76: usb: size RX page-pool pages from queue
 buffer
Message-ID: <ai50S1JgkAdVJfST@lore-desk>
References: <20260613224655.2405686-1-sean.wang@kernel.org>
 <20260613224655.2405686-2-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bg1KybBuqNpXKicp"
Content-Disposition: inline
In-Reply-To: <20260613224655.2405686-2-sean.wang@kernel.org>
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


--bg1KybBuqNpXKicp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> Use the RX queue buffer size to select the page-pool allocation order.
> This lets USB devices use larger RX buffers without silently allocating
> undersized order-0 pages.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mac80211.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index 13c4e8abe281..6ff1eada6d09 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -628,6 +628,9 @@ int mt76_create_page_pool(struct mt76_dev *dev, struc=
t mt76_queue *q)
>  	if (!is_qrx && !mt76_queue_is_wed_tx_free(q))
>  		return 0;
> =20
> +	if (q->buf_size > PAGE_SIZE)
> +		pp_params.order =3D get_order(q->buf_size);

I guess you are interested just in usb devices here, right? Moreover, are y=
ou
interested just in MT_RXQ_MAIN queue?

Regards,
Lorenzo

> +
>  	switch (idx) {
>  	case MT_RXQ_MAIN:
>  	case MT_RXQ_BAND1:
> --=20
> 2.43.0
>=20

--bg1KybBuqNpXKicp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai50SwAKCRA6cBh0uS2t
rFjmAQDs02PyFHYQXUrmHijoXehLFvuHRG+XsNI5x6nK+MRBzwEAnEd1hrSzNXIx
BjhBi2O6GmTUPAOU6BfaEib1AFDnngE=
=s+16
-----END PGP SIGNATURE-----

--bg1KybBuqNpXKicp--

