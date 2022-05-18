Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCD8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rHU+ExRHlNnlPS/jgQiwkHI/+YvIBph8nebVdB/9P4=; b=CiH4Ny7O/2VXiP2KF8DKHOSJit
	w8d7TzdaAZYl/+dILSGbo57KzSOrEwazOlmkd04kBV4X1pl4rFlL+kOV0V7eC9Tc9MLv2o/mxc/aQ
	WQAD388glvHIS1J5smupspmIwbH7HkpiVHf60hkBwlB6JwC+oEG6Rb9GAUPsNtUHKsikCzhdWPThO
	QKTx+rN+ZX5i910RYapAakkwAqAi6Z8mfkhkoMp42Pur74FeCKkJ8yhgD8PDC/isH/FtkhxWBzocN
	tLZzeXUay7BDkQwLPC9QFSaeHZQ/vRDFwjI9xzjnyeT1dedx0A4sGuWNaUlujZ/cwzilR77fUTwgU
	UUrLr0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrF4B-000bYO-7X; Wed, 18 May 2022 08:29:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrF48-000bWP-As
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 08:29:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B954B81EE6;
 Wed, 18 May 2022 08:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487EBC385AA;
 Wed, 18 May 2022 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652862592;
 bh=0abp1pszzsRBx5y5nc3egC4D4HkrMKsciN1YVkpNL6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IzQG4rxQryyz4XT24Lc3jCcLIMgpq3o5cM4Kw8JjxTBlkVJpFu7k+W8D71NpvrgFJ
 OQ/jjI3WaTLFvRI26qQ3nw1elquXdpbzm2vrzoSuo/59jHnWoD50iYgo1yQ+A3ZVNc
 ykQwWV4ptWmohUAA62Inkgc4rFpkgqTJomn+dQhqDc9YkxgKrAsSVN7lILAQvn/AwH
 MDByP5EQlmIr67oIZU/eVRG7k0rpwe0QqvTj1QNE/+QizdlCPUEFti+DuMBBnPryfB
 LLrxHxcnb+mJC+LX+EEhLaih3EsAzeaIsmV9HkPQIKIIcrbK9NYIX5tAQ5qLxNO2g5
 gxVLUGa7S5QOQ==
Date: Wed, 18 May 2022 10:29:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 04/15] net: ethernet: mtk_eth_soc: add
 txd_size to mtk_soc_data
Message-ID: <YoSufPWnGPdtVYZ+@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <22bd1bd88c09205b9bf83ea4c3ab030d5dc6e670.1652716741.git.lorenzo@kernel.org>
 <20220517183311.3d4c76fe@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220517183311.3d4c76fe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_012956_558011_76B5AF67 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: multipart/mixed; boundary="===============9050456981048647854=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9050456981048647854==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kza9CdNu8v+g1M7c"
Content-Disposition: inline


--kza9CdNu8v+g1M7c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 16 May 2022 18:06:31 +0200 Lorenzo Bianconi wrote:
> >  	eth->scratch_ring =3D dma_alloc_coherent(eth->dma_dev,
> > -					       cnt * sizeof(struct mtk_tx_dma),
> > +					       cnt * soc->txrx.txd_size,
> >  					       &eth->phy_scratch_ring,
> >  					       GFP_ATOMIC);
> >  	if (unlikely(!eth->scratch_ring))
> >  		return -ENOMEM;
> > =20
> > -	eth->scratch_head =3D kcalloc(cnt, MTK_QDMA_PAGE_SIZE,
> > -				    GFP_KERNEL);
> > +	eth->scratch_head =3D kcalloc(cnt, MTK_QDMA_PAGE_SIZE, GFP_KERNEL);
>=20
> Unrelated, but GFP_ATOMIC right next to GFP_KERNEL caught my attention.

ack, mtk_init_fq_dma() is run by mtk_open() so it is ok to use GFP_KERNEL. I
will fix it in v3.

Regards,
Lorenzo

--kza9CdNu8v+g1M7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYoSufAAKCRA6cBh0uS2t
rFYlAQC2wAg1jYAWiba7EodXO/uiiufplKyBb3ecXPYBR62etAD+ND4ZonW4brDP
P3P5htwp0JlPey9fJNA1452zhxCQOgs=
=0Wh0
-----END PGP SIGNATURE-----

--kza9CdNu8v+g1M7c--


--===============9050456981048647854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9050456981048647854==--

