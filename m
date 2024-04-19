Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82136C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLn6sA+tFXRFN9fw1dmPkOhK+4eMKOdYMNRVOnpDOYk=; b=J4eVzy+NatBeMumz/RzdOjmOIe
	ADaX8OdxU1Yf9J/jQ/T6cbtDXEqL1LgLQcIZgsbkSl+fM/oa5Y6VI0S8JgFKPg7gu3KZK0iE1zjgf
	jdiqc6vNKUkPlg6MZQVcX/Rqrl8kWd/MaUzLDYsbbiYSJ5MLxnVAU6hKH6dJV7sDWrnCoObP/31mZ
	88TVM/bGcSl9WY1+F2LPnUwI/By0bKOtXUwgowd7CwtfCNlZL+RFT7uNYdin3Avl03FEJ1GzkXFCj
	vgx6yPS+yQin+yQYltnPgU+0GwBP/azTkuJFXYrJRjGpbtHrjpHzLcg9Aqjg0/91mMmFlWr2/qoi6
	EpQ54uPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxiYU-00000004kxm-0uCY;
	Fri, 19 Apr 2024 07:21:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxiYR-00000004kvX-00td
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 07:21:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxiYB-0005ps-9Y; Fri, 19 Apr 2024 09:20:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxiY9-00D7BW-2B; Fri, 19 Apr 2024 09:20:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxiY8-003uPa-36;
	Fri, 19 Apr 2024 09:20:44 +0200
Date: Fri, 19 Apr 2024 09:20:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/4] gpu: Convert to platform remove callback returning
 void
Message-ID: <xqwcrxfrg3ogplh35c5etl6nbzw6zueilm4h6euh7bnpszyir4@6dtn5qdvijv3>
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zqtl7cbpfineoepn"
Content-Disposition: inline
In-Reply-To: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_002103_166963_7E3492BC 
X-CRM114-Status: GOOD (  19.71  )
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


--zqtl7cbpfineoepn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 09, 2024 at 07:02:47PM +0200, Uwe Kleine-K=F6nig wrote:
> with some patches sent earlier[1], this series converts all platform
> drivers below drivers/gpu to not use struct platform_device::remove()
> any more.
>=20
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>=20
> All conversations are trivial, because the driver's .remove() callbacks
> returned zero unconditionally.
>=20
> There are no interdependencies between these patches. This is merge
> window material.

I wonder how this series will make it in. While I would prefer these
patches to go in together (that I can consider this thread completed in
one go), I think with how drm maintenace works, it's best if the patches
are picked up by their individual maintainers. I guess that's:

 - Frank Binns + Matt Coster for imagination

 - Chun-Kuang Hu + Philipp Zabel for mediatek

 - Thierry Reding + Mikko Perttunen for the host1x driver
   (Note there is another patch for this driver set at
    20240409165043.105137-2-u.kleine-koenig@pengutronix.de that is
    relevant for the same quest.)

 - Philipp Zabel for ipu-v3

I plan to send a patch changing struct platform_driver::remove after the
end of the merge window leading to 6.10-rc1 for inclusion in next via
Greg's driver core. So please either care the patches land in 6.10-rc1
or ack that I include them in the submission to Greg.

Thanks for your cooperation,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zqtl7cbpfineoepn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYiG0sACgkQj4D7WH0S
/k5uYwf/bmP6h2EDhf4HeD6t6iH04mtOMqGj0P+x7unUIW9fwa+06Vtnjj0TW/DR
WgWu8rFS3I02j3D51b14SGZRNrIEXwSkNNVQLPZbe8pu9akVVYtymL7xxNM4ksLk
83PrwKdtdx2khdWfc7kOWM+zu2IkKTkHvRQqrx/jCrz9OpAA+2DJpqtt0CnYOMgu
eF4ev9d7wG7VdP8jks1/anWuqbDAIVStCnA1MaCISsXl2e2ZGZfSE99Mg1h94eLd
AX2IRPASplCkOA1L2Klfkye65Pqyfi1gnxnawcUbhkcZ4ffdg7jFAEaCXPqfHEKP
w+LYkIVZlBBGdz0EuoGrVlGwPo7Ixg==
=stkl
-----END PGP SIGNATURE-----

--zqtl7cbpfineoepn--

