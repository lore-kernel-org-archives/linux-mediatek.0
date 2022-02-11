Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C645BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbHcj1/P+baqW+uRGe/cUtwy69w7lZoj4E19i1azwHE=; b=1xfzKCadPZ4tYH6JWP6LbnYRTG
	oDldDBV4hQ6lKWl63wMeFgcIQTwaP3NlrKMnBnY0f9hI/Pw6ihnJbPbAKD7wCef/yhkEy1MdhDJqH
	gMoYVE7vMQamEkZjMPYhgnATQhY79l1rZVr3unAaGY9+1Lpi8eX0wnbR/orIs5qsYDOJ5TaIF4h7o
	vsVkhNK90Q1h/JaiL9OQGibsFAVSWRJ0mbP2QSgw8Qih5PMzqz7GPMDBXj10V5wOb0Rpo2hod/v9A
	LUSwROhf1bZXapKRP9SZThcVBapU9lKs5y6pwE9DP4MZmVx5HSvUeZ5W4sfyf9a8kZWZ+dtsX2W91
	oVWFxX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIYZD-007xjS-8J; Fri, 11 Feb 2022 16:14:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIYYt-007xbl-LO; Fri, 11 Feb 2022 16:14:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D2D7B82A95;
 Fri, 11 Feb 2022 16:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE074C340E9;
 Fri, 11 Feb 2022 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644596055;
 bh=sNz2tFUsc7yL/pDTYZgBpCU9uV+JsVM0G9jqqLqvVS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwgNsAej4XLRiZXEwDL7bwZAM73hhCpGYFCmS8Y6u8dtAKyi+fmfSTv9AJWAE2NeI
 KSzDwuVt9HFRbOvvpN1ayO7UN31FXA0Ceo6ao0md5ccyywTJcUwoi2C3JOV0sQrSGt
 RZWXUqS2O9OMReelWJYHPAB7PXNi3OMmTa9QRQXXRJYF1XB3VyhQGb3qQ2Nfq+2NN2
 KSVm73tUGepdEjLf02jl4IMwtYVaoUpB/Pp/TusIqrBCYPrpslzBOQOTE4Jsbz+4+V
 y/7LQF9rNVOomWzPV/XJkGr3z8oe/friRlhBR40sQwaU4/hcZbxA8/Fs7Rjw8Z3r7k
 B3GU6bwsnq+YQ==
Date: Fri, 11 Feb 2022 16:14:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/15] ASoC: mediatek: Add support for MT8186 SoC
Message-ID: <YgaLUNQXnGsZHuXQ@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
X-Cookie: do {
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_081420_494196_DAC8A2A8 
X-CRM114-Status: GOOD (  13.67  )
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
Content-Type: multipart/mixed; boundary="===============4309403357062900353=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4309403357062900353==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkn+amad5HrevOtl"
Content-Disposition: inline


--xkn+amad5HrevOtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:03PM +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE of MT8186 Soc.
> Patches are based on broonie tree "for-next" branch.

This all looks basically good, there are some issues which I've
highlighted on the patches but like I kept on saying they're all fairly
small and hopefully easy to address - there's no big structural problems
or anything that I noticed.

--xkn+amad5HrevOtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGi08ACgkQJNaLcl1U
h9CKkwf/SLonnfl3fV+46O1AC+u/WFZePStG+cGxvOGhs2iKcs612qJNEAOgEy0T
5lZRM+tTsja54tt7keZXc+AulVVpMOu2ROqTU4BJp3Zygt++snT8v2OTC3XSnjcI
vJOrvxSUxA3zKxdquTHgcCG+MQOjQi2B1MfD5gU5ZrJLhO9u6CjOSkhTFGwCdhn5
O38VRqcD17TbQXKnSqWKGOKJJWywGW84Gv2P7M7QlZqugFHkEzo21Fw+Y6m0SSQI
I/LKyDgTu+Me3OIweHSNrFO9WDAE3Pv8Q9V8alHjd+iGpGLJWBoHk3SMXVnCZEe2
xr5Jvd5fZyGKpL/T//Iyhxzqx84fDg==
=7jLS
-----END PGP SIGNATURE-----

--xkn+amad5HrevOtl--


--===============4309403357062900353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4309403357062900353==--

