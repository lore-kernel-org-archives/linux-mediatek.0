Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0029BC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Nov 2023 09:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmy1nX2nu6WGSdUCNWhHy8gccnDfb2mJrPXR3J5FQmM=; b=xrmCd8Hx3f7PO+leX9CXTEHeWI
	uyH3dAc8P9NRvR4UTVX3/oJUzMKoKI0rRnKN9AptyY5EN73gNNNaJZcPtb1s4xy28s07KW0PUEyZu
	XBwuLiWoKPy7JfghRZHawP4czsaqPzULJMKihwesr1iy5FJYd0uJV2/qr2Zt6NSjcKoNI/N90Lckj
	LABGEPqI+cn47tOXxS++az2EemVjoSqjhBcVpwmU6WbhXqWS7Ly5iW4UkC/JozR5qIvjYqpNjHzVt
	KwVKX/zWi/mgeXFwTcz6TKzMMGLTeBLV1eSFuU/PZTXT22eZtWfLeqOgJsLe4xkgvtmA3MUEnZE1v
	TvDjRctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzZpB-00EhGP-0K;
	Sun, 05 Nov 2023 09:53:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzZp8-00EhFe-1r
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Nov 2023 09:53:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzZow-0002g3-Vs; Sun, 05 Nov 2023 10:53:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzZov-006l9m-1v; Sun, 05 Nov 2023 10:53:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qzZou-00D8qC-OS; Sun, 05 Nov 2023 10:53:28 +0100
Date: Sun, 5 Nov 2023 10:53:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sebastian Reichel <sre@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-pm@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-kbuild@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 00/14] power: reset: Drop platform_driver_probe() and
 convert to platform remove callback returning void
Message-ID: <20231105095328.gi6yi455xlmihmms@pengutronix.de>
References: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="exvhp4fxjdw7awiz"
Content-Disposition: inline
In-Reply-To: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_015342_610321_4C5E4194 
X-CRM114-Status: GOOD (  22.47  )
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


--exvhp4fxjdw7awiz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sebastian,

On Sat, Nov 04, 2023 at 10:15:02PM +0100, Uwe Kleine-K=F6nig wrote:
> there are two different types of patches here that would justify to
> different series. But as the patches are not independant I chose to put
> them in a single series.
>=20
> The first three patches drop usage of platform_driver_probe(). This is a
> concept that isn't so relevant any more today. I didn't check, but it
> saves typically only a few 100k and there are thoughts to deprecate it
> to simplify the core. Getting the usage right is not trivial though the
> at91 drivers got it nearly right. The alternative to these patches is to
> add __ref to the driver struct ideally with a comment describing the
> need like is e.g. done in commit 5b44abbc39ca ("platform/x86: hp-wmi::
> Mark driver struct with __refdata to prevent section mismatch warning").
>=20
> The remaining patches convert the platform drivers to .remove_new(), see
> commit 5c5a7680e67b ("platform: Provide a remove callback that returns
> no value") for an extended explanation and the eventual goal. All
> conversions but one are trivial as the remove functions return zero
> unconditionally. The only exception is the tps65086-restart driver.

I forgot to convert two of the drivers that used platform_driver_probe()
before. I added them as patches 15 and 16 to this series in the hope
that b4 (or whatever tool you use to apply patches) gets that right.

> Uwe Kleine-K=F6nig (14):
>   power: reset: at91-poweroff: Stop using module_platform_driver_probe()
>   power: reset: at91-reset:: Stop using module_platform_driver_probe()

If you could do s/::/:/ on that patch description that would be great.
(Or should I resend for that?)

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--exvhp4fxjdw7awiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVHZhcACgkQj4D7WH0S
/k5Jtgf40bkUI/tsBT/eZ+3h+kAaBPC08oSM1xfjCN+GUtb6iX04GbymnfMlJtmv
CnIUVrxvvgtEN9L+hXNxSAieshEoBVk3TKFKI5mZWCxNUNL3L0KtsuHqWj5gcMSA
DIw46hr/yAJcUhiIkyDH3oPzSwVc1JMoOKJ550PInrP9gi9f7YppCPQBV0W7ifDP
DXV5xfmXq359kRsrbia2Tt0jOXMSoOdRM81O62BiNGQ7XceIjNKAeEx/NGm2jYag
oWwPyP4SbLNFVkqeNEiFD/4der+mqkJuefoQv+AlATpBsCUfzKDdcnmKjSbWhcGn
nRewc9gpBbRmYHpPKV3u7R91oOui
=xpzD
-----END PGP SIGNATURE-----

--exvhp4fxjdw7awiz--

