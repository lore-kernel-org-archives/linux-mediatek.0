Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAC8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tg9QZl4FdlWxdk7tGwb1Gt+IXszHrOnabdo2VqKF+g=; b=GCHDGLMEmMyLpFoC1e7fRjqy6k
	RvpgE25qNNpIRIzCVqDlVXKVpTLgauwfNlGKtCPYv4P0WUTbcHZhpQl03Mk3X3jWto0z7enUQnu6b
	QCMo2aXlLY9Lw5idafYRxQOHRmQ+SNq46Tzo36FQ0RYSywRI/lWSB3D2SUwqqjzZYfdaUOpUULQkO
	ZQxNRMg6U5wwWbTZv5TFz1idzTjpI9Y0jeHLsR06znpZ/3sqZUSYygT1B65/Pzz4wPaSbiUhVTLdV
	h5SDEVhmMW3zoOAxfmte8xeBJ2iq8Y6KdFLJQX+VsUdl4l+CHk0C9JstkeHOyf1S8ybB3PJPZ1pOZ
	sZQgI2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n80a0-006BcO-Sh; Thu, 13 Jan 2022 13:55:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n80Zy-006BbM-Gu
 for linux-mediatek@lists.infradead.org; Thu, 13 Jan 2022 13:55:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC4B5B821C2;
 Thu, 13 Jan 2022 13:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1CBC36AE3;
 Thu, 13 Jan 2022 13:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642082147;
 bh=0yi7miC80eJvdinhs4soCLQBE+jBvBlyWx4ILlEeeWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EKR7zTs1UbVjV6WgKd8Pdgo1Gaxb8V6w+tZTFqHaSXQGZeYBwBnDtdREShXrd6+1J
 qryYtFba27ZDpbTdjqdUZD083OhCfDDqHe1HsXt9v/c+IsDbH+y4sUJDINmyO1v/CM
 +TXYRQrHahmrwVUS5IVxVV1C0DOh9LP6S5MkTG2bh6Pm9qbeECJ38zRYhqFBvtyx1H
 tiQvrQI0Lrpfla/nqSwZUqFIFkHUMozyF0+34j/BeCkkN2Y62FRx9fZj8LJYwOngyE
 +0aHAtWItLffWjoFXNqPGpzpEb3F9xvDDfj7RrK3D5+lzYUUHDC65C6ftRfmzQ8G6O
 la4xCymo5Dndg==
Date: Thu, 13 Jan 2022 14:55:43 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Bo Jiao <bo.jiao@mediatek.com>
Subject: Re: [PATCH v2 3/5] mt76: mt7915: add support for MT7986
Message-ID: <YeAvXzG6ueZWxoGa@lore-desk>
References: <cover.1641901681.git.Bo.Jiao@mediatek.com>
 <8b2098132192c0381e41ac78a47b7318d5c28b04.1641901681.git.Bo.Jiao@mediatek.com>
 <Yd7ZKb7Qsh4lGA5E@lore-desk>
 <2ab2731dc44494dbfe89363638cdcaf49351afbe.camel@mediatek.com>
 <Yd/8mXumr25iESux@lore-desk>
MIME-Version: 1.0
In-Reply-To: <Yd/8mXumr25iESux@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_055550_751329_96BEC008 
X-CRM114-Status: GOOD (  24.14  )
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
Content-Type: multipart/mixed; boundary="===============4153764074252695685=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4153764074252695685==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="deosE2qSAUpl8QTU"
Content-Disposition: inline


--deosE2qSAUpl8QTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > On Wed, 2022-01-12 at 14:35 +0100, Lorenzo Bianconi wrote:
> > > >=20
> > > > @@ -302,6 +316,15 @@ struct mt7915_dev {
> > > >  		u8 table_mask;
> > > >  		u8 n_agrt;
> > > >  	} twt;
> > > > +
> > > > +	struct reset_control *rstc;
> > > > +	void __iomem *dcm;
> > > > +	void __iomem *sku;
> > > > +
> > > > +	struct {
> > > > +		bool is_7975;
> > > > +		bool is_7976;
> > > > +	} adie[MT7986_MAX_ADIE_NUM];
> > >=20
> > > do we really need it? Can we just read data from chip when necessary?
> > > it is not
> > > access in the hot-path, right?
> > > I think it is easier and more readable.
> >=20
> > Adie registers are inaccessible after wfsys power on so we need some
> > places to store chip configuration.
> > We will modify it to make it more readable.
> > + u32 adie;
>=20
> what I mean is just continue reading these values after the first time (t=
hat is
> in common for both approaches).

ok, sorry I misread your reply. Anyway it seems to me we need these values =
just
in mt7986_wmac_enable() (or in routines called by mt7986_wmac_enable). Righ=
t?
If so maybe we can just store them in a local struct in mt7986_wmac_enable(=
).
What do you think?

Regards,
Lorenzo

>=20
> Regards,
> Lorenzo
>=20
> >=20
> > thanks,
> > Peter
> >=20



--deosE2qSAUpl8QTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYeAvXwAKCRA6cBh0uS2t
rGbtAQDszbOeIxttHkVRqWbN0gIDFX47nidjwe49+fUAMinPyAD/RspZ1yRoxMxk
O7mDViAVXOkX/CzjlfI3W738AK/nYAA=
=4ixS
-----END PGP SIGNATURE-----

--deosE2qSAUpl8QTU--


--===============4153764074252695685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4153764074252695685==--

