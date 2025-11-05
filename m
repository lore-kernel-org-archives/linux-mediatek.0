Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A854CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 08:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S31gMYw1WXGaHpCFolUz4BlhmjrxC6ObvMdRMtC/eP4=; b=nYggLJlHqZIW0ZDPteo469IcL+
	JHBBHNbyl2mCrvGVGji2aUVaoTjsZ6w4WkIDjyjNpOHznCZkL9UteLdKA7ga6dA9h+CGWhF1o5h5P
	9tA63Ez5yOdoSA1xSzgD4odBCnueyE6x7lLDgz9G4MTgmsLwlYxgycDc4xzyf5Vkw3UiL8Fv2OAKe
	DqguhB6NNh6K2rpRYbtMYQ5TQB9mte+vgdRBJASC5SEM7NARWBB2c3EKdWPHja8K47IhQywMSGY9i
	2iUDfbzbKY4YaLQ0a2fQ0v4cEqcgpjUz0NeFh5SFG5zd1p9G9EcyalJ2AccgNevefHQheOeeOs5qk
	sRaazKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYiv-0000000DGZp-0tSQ;
	Wed, 05 Nov 2025 08:18:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYit-0000000DGZK-0bvC;
	Wed, 05 Nov 2025 08:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C5A7601FF;
	Wed,  5 Nov 2025 08:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC00C4CEF8;
	Wed,  5 Nov 2025 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762330710;
	bh=6dm2AKzAebown1VDbZeg2XcaDBZxitJGUDcB4OCfOSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mj4R6jbmdeurLRtVZDcDkzqUdRr+Gc1azx+5dE8nELWTapqWHnFWY19NgW7t1r/QV
	 bb9lTheuUfK/V+i7acJlOTc754Jwlw2YxSnEQGbkmWqGi1yvvrg890JUZH26GnPlfO
	 PTaIcKPL1gtbpntu4A7bn1sE+/3+EDkt2sUDw698vwXQFx9kUtj5Nx796THHRuIAyq
	 EMr+jX9CVzPyq6ZSJvekb52iIAPkREpXkJZd/zzTeOh41DtpnMTAEP3DPWmNc4K/Pu
	 RSbdzcc89+v+cKZyGR08dp8RSoi7E3RJwIkM3RY66yb6V6nxu1keCW4+agmgvUXSui
	 DnQ0AakHat1Kw==
Date: Wed, 5 Nov 2025 09:18:27 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Xuegang Lu <xuegang.lu@airoha.com>
Subject: Re: [PATCH net-next 1/2] net: airoha: Add the capability to consume
 out-of-order DMA tx descriptors
Message-ID: <aQsIUzZOJxMV5UDP@lore-desk>
References: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
 <20251103-airoha-tx-linked-list-v1-1-baa07982cc30@kernel.org>
 <20251104183028.7412aba6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hS5bIEDocn2WJRXk"
Content-Disposition: inline
In-Reply-To: <20251104183028.7412aba6@kernel.org>
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


--hS5bIEDocn2WJRXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 04, Jakub Kicinski wrote:
> On Mon, 03 Nov 2025 11:27:55 +0100 Lorenzo Bianconi wrote:
> > +		__list_del_entry(&e->list);
> > +		list_add_tail(&e->list, &tx_list);
>=20
> list_move_tail()

ack, I will fix it in v2.

>=20
> > +		e->skb =3D i ? NULL : skb;
> > +		e->dma_addr =3D addr;
> > +		e->dma_len =3D len;
> > +
> > +		e =3D list_first_entry(&q->tx_list, struct airoha_queue_entry,
> > +				     list);
> > +		index =3D e - q->entry;
> > =20
> >  		val =3D FIELD_PREP(QDMA_DESC_LEN_MASK, len);
> >  		if (i < nr_frags - 1)
>=20
> > @@ -2029,10 +2020,14 @@ static netdev_tx_t airoha_dev_xmit(struct sk_bu=
ff *skb,
> >  	return NETDEV_TX_OK;
> > =20
> >  error_unmap:
> > -	for (i--; i >=3D 0; i--) {
> > -		index =3D (q->head + i) % q->ndesc;
> > -		dma_unmap_single(dev->dev.parent, q->entry[index].dma_addr,
> > -				 q->entry[index].dma_len, DMA_TO_DEVICE);
> > +	while (!list_empty(&tx_list)) {
> > +		e =3D list_first_entry(&tx_list, struct airoha_queue_entry,
> > +				     list);
> > +		__list_del_entry(&e->list);
> > +		dma_unmap_single(dev->dev.parent, e->dma_addr, e->dma_len,
> > +				 DMA_TO_DEVICE);
> > +		e->dma_addr =3D 0;
> > +		list_add_tail(&e->list, &q->tx_list);
>=20
> and here

ack, I will fix it in v2.

Regards,
Lorenzo

--hS5bIEDocn2WJRXk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQsIUwAKCRA6cBh0uS2t
rPJkAP4yzuHDQ7sWyCbkzqc+ZXYnrez5YP0v+l941SBgBN0fegD/TwBE8obRX0zg
zcgzcaEMDgJ/ETRCP9t2SZonYUps0Qk=
=lBxi
-----END PGP SIGNATURE-----

--hS5bIEDocn2WJRXk--

