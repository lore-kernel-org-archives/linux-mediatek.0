Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B49EED618
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dRz/nFByru5ZN1IrkNOxZIq4ru/dlSqtenwCMTzYW0=; b=0w++O+vFU9z028jXZprIksrk/W
	Swe3StXD8ZTPwFT7Yknjiejl4JpmizMOs6SxAn9sPlB8m96gpm2/AbgBjHHSc28M97+8cH3DQMKkD
	PV5BhO4DBGn5IGKUJjF+8zleFbTRLdA01YOC7CrqDsEYNo9zhYveBcR6IIe9AkDV5OfFaTuithpWp
	erYJ8vyV2YRbnqY4He7xVpMhHNKeufiu/GmdglibQoPzUY75NcL9pbBA8MbziF8Pxfi0wzhNmvL45
	GDe61suIc8dTMIF7q3N2KzR2W6W1RSDyac7Fg/uekfSqzqcpKaTg4YFTUlnEN5ZV1czDn+AHD6dRh
	Jz/U+dkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhBgf-00B3RD-1t;
	Fri, 15 Sep 2023 16:28:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhBgc-00B3Qr-2K
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 16:28:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66BF16210F;
	Fri, 15 Sep 2023 16:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B929C433C8;
	Fri, 15 Sep 2023 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694795332;
	bh=xFP4xP9LgYUNQYWlHLEw+gHE48/2qAyc2EfESi3YoiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONYvrKPbd80wQteDgGA4/C/inRBfN9eLEkTU51VoXcnrs4QWl1IRU7FQOEp/FL9kT
	 DDIRkzvi9g06a8WNelzs4R/OZlsX5jDMIkw4kX80Wa2/vkR5+Awuq8XIADoqzamYaW
	 5k6K6uPdYabwSUxl2ZJREpYDAEGIw+oCxriQKyweKmzoAld0wh3+4GtUGB22UtwHMc
	 YdmwhlPGcsvXWAxbBi3TsTc0FhnODy1d7cHx52xbmLwN+1wxbMZjnT+l62d2VqxjiC
	 anMmFZfFL9QCgoG4XHGROHf6NS0TsPlRlKNXw8ZnFlf8Vf0gdH8Wt3IFMAokM+jdjX
	 txiefVRftqsiw==
Date: Fri, 15 Sep 2023 18:28:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name,
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org, sujuan.chen@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 10/15] net: ethernet: mtk_wed: introduce WED
 support for MT7988
Message-ID: <ZQSGQH5n78e0wpz7@lore-desk>
References: <cover.1694701767.git.lorenzo@kernel.org>
 <330efa9f15a6da8a8e7596d3a942f3e893730e12.1694701767.git.lorenzo@kernel.org>
 <20230915145548.GA3704791-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yyt0PgioCXTYT4h4"
Content-Disposition: inline
In-Reply-To: <20230915145548.GA3704791-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_092854_822830_29B566B2 
X-CRM114-Status: GOOD (  12.49  )
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


--Yyt0PgioCXTYT4h4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Sep 14, 2023 at 04:38:15PM +0200, Lorenzo Bianconi wrote:
> > From: Sujuan Chen <sujuan.chen@mediatek.com>
> >=20
> > Similar to MT7986 and MT7622, enable Wireless Ethernet Ditpatcher for
[...]
> > -	ring_size =3D dev->wlan.nbuf & ~(MTK_WED_BUF_PER_PAGE - 1);
> > -	n_pages =3D ring_size / MTK_WED_BUF_PER_PAGE;
> > +	if (!mtk_wed_is_v3_or_greater(dev->hw)) {
> > +		dev->tx_buf_ring.desc_size =3D sizeof(struct mtk_wdma_desc);
>=20
> Instead of checking the version or using of_device_is_compatible() in=20
> other places why don't you define driver match data for all this static=
=20
> data.

ack, I will look into it.

Regards,
Lorenzo

>=20
> Rob

--Yyt0PgioCXTYT4h4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZQSGQAAKCRA6cBh0uS2t
rJXiAQCakzUT0GOnyU0/R38SoArHgoeIBl5bxY1xtoxwJOUMgwD/b+t/uUG8UFJk
rErIrPODkOdRCFq961CiUNRTVAzv+w0=
=SpFW
-----END PGP SIGNATURE-----

--Yyt0PgioCXTYT4h4--

