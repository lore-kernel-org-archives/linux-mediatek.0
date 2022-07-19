Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D4C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO2Yeg1EjCoAnHuO2qJc5128tqfv4keTxr6JIGZsXXw=; b=e2+JSXIQNUPebdovEAE/gWi1F4
	nQe7sBS/2R7eXiYarHsjD3HP0IUkm6+hcb6Tip3pVhDIDDpAaFoYdLZVwFvHTQ+67aHKOqUzBVVIs
	LfXSVeiNvcas0kQ73ER1LRBnMq4PcNwvdCJgMe8wS1hjiHvIy4T5lSozwK5GSY7xWQGsVVImeYuB1
	Gdcttj5RVYAS6O1/zLLSSSWSAd+93n5jVxveMhux2KccUXn6SH/E3YRb5d+i7IzuCg4aAndTBa7Pa
	wn7g6/LePmD+mw2sXvefLQ5snqGdatB24oTkI2Y8CW9+Hc5+8uU/r0GBIqHlKjpSV58xxXb4hi5Ul
	H7y1C09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkVV-0080sW-U4; Tue, 19 Jul 2022 10:31:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkVT-0080rL-Fp
	for linux-mediatek@lists.infradead.org; Tue, 19 Jul 2022 10:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658226670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hO2Yeg1EjCoAnHuO2qJc5128tqfv4keTxr6JIGZsXXw=;
	b=BI+qXY5noqQ+s/TY3IZjx8jeiek/uUHYjVmwcUE3TblyJ9QPAJIZYw3HGIiGHSpDbwl/MQ
	lzBaXTrJOoDFBvM7tpnVkgzCpyNFKqkYk6xOc/Fftquh+Va/C6ELZGrLBXguWAK1gI0OvZ
	YVh1o5pE3lXNBfdJ4WG4oPCBwBQc/qM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-j-zF06SiOMy_J14XkwBfOw-1; Tue, 19 Jul 2022 06:31:08 -0400
X-MC-Unique: j-zF06SiOMy_J14XkwBfOw-1
Received: by mail-wr1-f70.google.com with SMTP id t13-20020adfe10d000000b0021bae3def1eso2426354wrz.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 03:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hO2Yeg1EjCoAnHuO2qJc5128tqfv4keTxr6JIGZsXXw=;
        b=fpWVO1x8PUzBhH+8dchz6n0A1AHsTpVFGgSWvZ8maVRP7NHkdwzQ3u4KTLgdTPQqMA
         z3Z4a/P4HD9uuuwlid/PHJG9M6U6Es9yWuJmgCQw2e6M5M0/duDQATMV9hN3QAcAgqae
         xqVHwdEU5vlYsU1omdOw9+3FK87SEk57Y5Q/Ig7nBLVUdKidDeWu0g9KXfW1iVg7BmbC
         LhGoXjple8EwlApfFBUcjgy07YDbtqlntPbp+hI5stJv27qlciXy4eIOl+K5xuV6P/4h
         QLNQ6BVpRSCXNUiTMuWdL95r66guFbx/WhQNlgjStlyxDl06npBkqEVhRHAz9tIAkHZK
         E80g==
X-Gm-Message-State: AJIora+cPQrcKCVTJrC1KXbNjEhRKYkEK1Muyc6imKEgmxO8tJmScPPx
	QGU2yUoJrUs28nhCX0Oa6e9mkCu1tMLeCam0fJoLQfm5WJb/Z9gDFffszr0ahbhVM+3pTUcc6H/
	VtU4vssXVwPkSLa458T1iLNg7GOCtpNi9
X-Received: by 2002:a05:6000:60a:b0:21d:9451:e91 with SMTP id bn10-20020a056000060a00b0021d94510e91mr26875713wrb.73.1658226667770;
        Tue, 19 Jul 2022 03:31:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u5W1ZH8zhxxQtjlgAOgTvXC10C+B+JsErYZGSxT0hoMG5tSx5BYrru2+olfB8xvHNGilqN1w==
X-Received: by 2002:a05:6000:60a:b0:21d:9451:e91 with SMTP id bn10-20020a056000060a00b0021d94510e91mr26875691wrb.73.1658226667533;
        Tue, 19 Jul 2022 03:31:07 -0700 (PDT)
Received: from localhost (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.gmail.com with ESMTPSA id i3-20020a05600c14c300b003a32251c3f0sm2103638wmh.33.2022.07.19.03.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 03:31:07 -0700 (PDT)
Date: Tue, 19 Jul 2022 12:31:03 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
	nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, ilias.apalodimas@linaro.org,
	jbrouer@redhat.com
Subject: Re: [PATCH v3 net-next 2/5] net: ethernet: mtk_eth_soc: add basic
 XDP support
Message-ID: <YtaH523Jz39smaNO@localhost.localdomain>
References: <cover.1657956652.git.lorenzo@kernel.org>
 <b4c7646e70b1b719b8ae87a90bb8e4cf57b1a26d.1657956652.git.lorenzo@kernel.org>
 <5b6d4061bd12a9079e882742c750962816ee6567.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZUXewXXKXjpZZxkt"
Content-Disposition: inline
In-Reply-To: <5b6d4061bd12a9079e882742c750962816ee6567.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_033111_622168_79F3BEB7 
X-CRM114-Status: GOOD (  17.15  )
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


--ZUXewXXKXjpZZxkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 2022-07-16 at 09:34 +0200, Lorenzo Bianconi wrote:
> > Introduce basic XDP support to mtk_eth_soc driver.
> > Supported XDP verdicts:
> > - XDP_PASS
> > - XDP_DROP
> > - XDP_REDIRECT
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 147 +++++++++++++++++---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.h |   2 +
> >  2 files changed, 131 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/=
ethernet/mediatek/mtk_eth_soc.c
> > index 9a92d602ebd5..bc3a7dcab207 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -1494,11 +1494,44 @@ static void mtk_rx_put_buff(struct mtk_rx_ring =
*ring, void *data, bool napi)
> >  		skb_free_frag(data);
> >  }
> > =20
> > +static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
> > +		       struct xdp_buff *xdp, struct net_device *dev)
> > +{
> > +	struct bpf_prog *prog =3D rcu_dereference(eth->prog);
>=20
> It looks like here you need to acquire the RCU read lock. lockdep
> should splat otherwise.

ack, I will fix it in the next version.

Regards,
Lorenzo

>=20
> /P
>=20

--ZUXewXXKXjpZZxkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYtaH5AAKCRA6cBh0uS2t
rFf+AP46JU45b0ZcVix0m0IoJyrPrwyRX9cf3KPyrpMERkh+cAD/Wvf0maFDO3Ik
E6XxXoMI1gVlKm5UUawDVfVxPiXrLws=
=m7o8
-----END PGP SIGNATURE-----

--ZUXewXXKXjpZZxkt--


