Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E02C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3k6ZIYOtCTcrOf9yA4jDGWXeObIxtGg78n2UkjgslNw=; b=0Fh+W+AKCY6YksndyEfxnn772N
	UPgqRg2/a4biC8Bzp0ot7ZdGQdk2NU86aKdrQ8X0rv6CxGVI6S0/hmWzfSMsyhmou8+WLWlhoeSjV
	m7ezp1cyCKG6quJNmnWXb8AakTlCsMcdjp54k5apOQ8+KnnEvquF9zQXa27M9dON3513uVUr+tnNN
	a4BTajFtfMSo5kPWqVCP9kywpd5zQX6j7TKssIfoL1bb3uppVq9ibnT7+WRaHajlL2xSOcNpAu030
	Kz9Q1wIER0xfbw+Fqyy2P3C+v/u9TKEI/faacN0px1KpjooiW4gWfZCSq59diORglJrlCw1BF7X84
	e5wNqjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrF6F-000cDj-OE; Wed, 18 May 2022 08:32:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrF6D-000cDF-6B
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 08:32:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAC7D61659;
 Wed, 18 May 2022 08:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9764CC385A5;
 Wed, 18 May 2022 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652862724;
 bh=i89CmjQPbwZ9I9KW+4ilTsAY0H2ZbdEroLHap47HDXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C5T2kghxgwBMfELFaEmQrxZIBvIRmHgwzjoA3M+9eLJBlZULCe4//RScbNKfzKO6Y
 rQvn1wmwsjRmwSl7rhcqv6APE0sD9Ggac+rI7cekD6H/kURWc67LuYs/qzdiIMdLV2
 W0uh2NzB+sxTgmHegrEtJq2YOLX5W/uEre6Qjw2gtoFKC4bEwjZACQ2MsVNJo5xZkT
 eYCO/sGPyUpT72Qq/pvWSgtgIXjxIZ5s3+7KPY+ojT1tWRWnx8GTGRFZ+L2rmnPifB
 4FYFNhIsP7P62AFZm94aKgo7nSH3xJUieCYSUOFgqgbbIJJaVAeLGPt/CCJ/wfWjPd
 sKtGDpEPAGC7Q==
Date: Wed, 18 May 2022 10:32:00 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 05/15] net: ethernet: mtk_eth_soc: rely on
 txd_size in mtk_tx_alloc/mtk_tx_clean
Message-ID: <YoSvAPd6QaEZi0vh@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <c5228daa3d277cd71a134a1062525bc19b34fa2f.1652716741.git.lorenzo@kernel.org>
 <20220517183522.4a585885@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220517183522.4a585885@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_013205_306622_8A9A3333 
X-CRM114-Status: GOOD (  14.47  )
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
Content-Type: multipart/mixed; boundary="===============8957475544304917307=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8957475544304917307==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V952YIebYHLveMod"
Content-Disposition: inline


--V952YIebYHLveMod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 16 May 2022 18:06:32 +0200 Lorenzo Bianconi wrote:
> >  static int mtk_tx_alloc(struct mtk_eth *eth)
> >  {
> > +	const struct mtk_soc_data *soc =3D eth->soc;
> >  	struct mtk_tx_ring *ring =3D &eth->tx_ring;
> > -	int i, sz =3D sizeof(*ring->dma);
>=20
> The change would be smaller if you left sz in place.=20
> I guess you have a reason not to?

ack, I will do in v3.

>=20
> > +	struct mtk_tx_dma *txd;
> > +	int i;
> > =20
> >  	ring->buf =3D kcalloc(MTK_DMA_SIZE, sizeof(*ring->buf),
> >  			       GFP_KERNEL);
> >  	if (!ring->buf)
> >  		goto no_tx_mem;
> > =20
> > -	ring->dma =3D dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
> > +	ring->dma =3D dma_alloc_coherent(eth->dma_dev,
> > +				       MTK_DMA_SIZE * soc->txrx.txd_size,
> >  				       &ring->phys, GFP_ATOMIC);
>=20
> Another GFP nugget.

ack I will fix it in v3.

Regards,
Lorenzo

--V952YIebYHLveMod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYoSvAAAKCRA6cBh0uS2t
rPEcAQD4hpMut1iYt3xxUlNN+ANkFcAie0jZ9H74iYcNnZFTBQEAjNI2Lf419uvr
vkbOZqF7Pt+jc7JdoTgftIcE/levnAI=
=oaCo
-----END PGP SIGNATURE-----

--V952YIebYHLveMod--


--===============8957475544304917307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8957475544304917307==--

