Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED7C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcjtNV9wmZc8THaTXZx2TGH+KDR4cetIcGJyUCqmf7U=; b=qrnQg8A+sWG1nefWf7IFlY8KmP
	y753NmfhXhHvpxrxyt6rohXbHaaXTSTVQztTQFjhikizcJbQak8G6KwI6VXgPPnQmFaQJWdwLFXVA
	2F+vAH4zF7AdSzlEq7+D0wOb5TpbZ5MJy4i1dge8+rYM9J3QXq4TB8exzcZk3eGeKBhR6sX8/cjig
	SXcILD1orAH/Osp82Ta6cRRoZLtBkXQRHg4ss6J1k3PFAgF2Eth9rYJFl1CE3a+Lavr/PwQ0slYFb
	j7H6yTTpEWBw68Fx152fFdTyfxA30uR0amD5R7KdS1u/p1JW3GHuV5pSIv+utUVgdBp7EjO3H5fMc
	GKQSRz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkLi-007xC0-V6; Tue, 19 Jul 2022 10:21:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkLf-007x4o-Fi
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 10:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658226061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcjtNV9wmZc8THaTXZx2TGH+KDR4cetIcGJyUCqmf7U=;
	b=UNa0ICzZu/bvK3k/0VDkkxKy9JxSx/vd2P1TKCilRhFHd+xQHh2Pq97aC+utwbD3W2ALFB
	JYpbcFgZThwtayq63b0zBjVcM36Ye5ZerIDQS2ez41fyxNbIvGySydom8pfwn1VgpGJL8l
	zntHNrl2WqkmxsxK71/JMjXmdd0QsQ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-GlEq19StPBSMk0y3AMr58Q-1; Tue, 19 Jul 2022 06:18:41 -0400
X-MC-Unique: GlEq19StPBSMk0y3AMr58Q-1
Received: by mail-wm1-f71.google.com with SMTP id i133-20020a1c3b8b000000b003a2fe4c345cso862948wma.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 03:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bcjtNV9wmZc8THaTXZx2TGH+KDR4cetIcGJyUCqmf7U=;
        b=UrXlvYry5FErxOYPE9nk8L122FumGOKicY4MXnF//J29CkEr8db1JLv3KsTOOIt3Kg
         KLz8asnwf/XHYTl/83CC3zrYGUG4H+JSR8GWOcGcc/9hnYFk6A0eJO8quoNJ7f8s2FSC
         9bONzr1IKrxbdzLKiiG7jPkx96wsEaROUeSXKXNBxg9sQ8yOc23a/vfJs96Qtgeo2151
         j7kTnvHD/VlGP+s4qywfxej/T5S5i3w5bTn70I4O4MrXXdmZNjm0tQapfHuwAzhWcTHO
         c1Q0S6/bPuX584mdmbpklH0NHU+z6QbEF0eRAoMuWJtVgVTpf+mp0ELtJGLRhnF3VVd1
         gdXg==
X-Gm-Message-State: AJIora91ph9bt+cI0t4L5s49cfX73O97w6+P/+TGFMfDFz0+h33xGxSV
	eyZnG4ZHuVmpCvAUQTQaMzE+2Q9+qomq8ZoiSgaJKhj6/yXblJ0AAelmoTnk8F7Ob9Cp7ArlZOx
	4ClLq0ttTbUENOVDWYPkh0sP1rkOLtuFR
X-Received: by 2002:adf:f492:0:b0:21d:89d5:9443 with SMTP id l18-20020adff492000000b0021d89d59443mr25729799wro.201.1658225920319;
        Tue, 19 Jul 2022 03:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+M6eTgVqsnCSPqeqomALCw6aMTVg+qP8eQypC4kapQKeN4OsBGXpfQ8ticMzI81qfRUHLsw==
X-Received: by 2002:adf:f492:0:b0:21d:89d5:9443 with SMTP id l18-20020adff492000000b0021d89d59443mr25729775wro.201.1658225920107;
        Tue, 19 Jul 2022 03:18:40 -0700 (PDT)
Received: from localhost (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.gmail.com with ESMTPSA id e9-20020adfef09000000b0021b89f8662esm12922622wro.13.2022.07.19.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 03:18:39 -0700 (PDT)
Date: Tue, 19 Jul 2022 12:18:36 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, ilias.apalodimas@linaro.org,
	jbrouer@redhat.com
Subject: Re: [PATCH v3 net-next 5/5] net: ethernet: mtk_eth_soc: add support
 for page_pool_get_stats
Message-ID: <YtaE/KJDNOqkvLml@localhost.localdomain>
References: <cover.1657956652.git.lorenzo@kernel.org>
 <8592ada26b28995d038ef67f15c145b6cebf4165.1657956652.git.lorenzo@kernel.org>
 <43ff0071f0ce4b958f27427acebcf2c6ace52ba0.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8SZvmLJxItoVIA7C"
Content-Disposition: inline
In-Reply-To: <43ff0071f0ce4b958f27427acebcf2c6ace52ba0.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_032103_715770_59859BB9 
X-CRM114-Status: GOOD (  24.92  )
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


--8SZvmLJxItoVIA7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 2022-07-16 at 09:34 +0200, Lorenzo Bianconi wrote:
> > Introduce support for the page_pool stats API into mtk_eth_soc driver.
> > Report page_pool stats through ethtool.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/Kconfig       |  1 +
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 40 +++++++++++++++++++--
> >  2 files changed, 38 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethern=
et/mediatek/Kconfig
> > index d2422c7b31b0..97374fb3ee79 100644
> > --- a/drivers/net/ethernet/mediatek/Kconfig
> > +++ b/drivers/net/ethernet/mediatek/Kconfig
> > @@ -18,6 +18,7 @@ config NET_MEDIATEK_SOC
> >  	select PHYLINK
> >  	select DIMLIB
> >  	select PAGE_POOL
> > +	select PAGE_POOL_STATS
> >  	help
> >  	  This driver supports the gigabit ethernet MACs in the
> >  	  MediaTek SoC family.
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/=
ethernet/mediatek/mtk_eth_soc.c
> > index abb8bc281015..eba95a86086d 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -3517,11 +3517,19 @@ static void mtk_get_strings(struct net_device *=
dev, u32 stringset, u8 *data)
> >  	int i;
> > =20
> >  	switch (stringset) {
> > -	case ETH_SS_STATS:
> > +	case ETH_SS_STATS: {
> > +		struct mtk_mac *mac =3D netdev_priv(dev);
> > +		struct mtk_eth *eth =3D mac->hw;
> > +
> >  		for (i =3D 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++) {
> >  			memcpy(data, mtk_ethtool_stats[i].str, ETH_GSTRING_LEN);
> >  			data +=3D ETH_GSTRING_LEN;
> >  		}
> > +		if (!eth->hwlro)
>=20
> I see the page_pool is enabled if and only if !hwlro, but I think it
> would be more clear if you explicitly check for page_pool here (and in
> a few other places below), so that if the condition to enable page_pool
> someday will change, this code will still be fine.

Hi Paolo,

page_pool pointer is defined in mtk_rx_ring structure, so theoretically we =
can have a
page_pool defined for queue 0 but not for queues {1, 2, 3}. "!eth->hwlro" m=
eans
there is at least one page_pool allocated. Do you prefer to do something li=
ke:

bool mtk_is_pp_enabled(struct mtk_eth *eth)
{
	for (i =3D 0; i < ARRAY_SIZE(eth->rx_ring); i++) {
		struct mtk_rx_ring *ring =3D &eth->rx_ring[i];

		if (ring->page_pool)
			return true;
	}
	return false;
}

Regards,
Lorenzo

>=20
> Thanks!
>=20
> Paolo
>=20

--8SZvmLJxItoVIA7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYtaE+QAKCRA6cBh0uS2t
rEC5AQDq6EMtRHb11mzlTo2GCWmwsHt8GBeA4GkaEOItm4V61AD9GDfcR58iPC2G
KiaDgzLAhaM4cRamwlleYBG9gLFClgk=
=7eQa
-----END PGP SIGNATURE-----

--8SZvmLJxItoVIA7C--


