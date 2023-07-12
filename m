Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCAFEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erayjZXITfM4MfnsLSpDFgf/EiEK5R/o3vBj9UP4zyM=; b=ZMJJ35l6npS7emIvA+Diay26dh
	xpLuCpcP71A38hp9LmkDI0qhXwPPALjOBx9uYdpbdAL3RBmiUaPDW8qFoJaGDvTkQJGQJ4DSBePUq
	LCavb8s5jMK6rl2RFHhDmOprv4HE0G8r5J05SXhiD4OjOxZ+88ptdcnV15HZvY0+dfRV1hzHvrgBW
	Icw8eDNCtwlDtxbPjDtjxf91ha1wtz3aR2bZmm9IWCkguK/yXdhgGpoMiqegnQ9ZloWk8nMJerw3q
	/WYrmitRXzH/DZd+B6eVrybcOimQ4337mw9W7uVXA08JHXyHiKqWFYDVtohjeanZo6EH0NwdkluDU
	V/34Qtmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWsD-00H8zU-1X;
	Wed, 12 Jul 2023 10:15:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJWsA-00H8y1-0L
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 10:15:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWrv-0008Pi-Ch; Wed, 12 Jul 2023 12:14:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWrt-00DrcU-UX; Wed, 12 Jul 2023 12:14:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qJWrt-004Haj-8R; Wed, 12 Jul 2023 12:14:45 +0200
Date: Wed, 12 Jul 2023 12:14:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 06/27] thermal/drivers/mediatek/lvts_thermal: Convert to
 platform remove callback returning void
Message-ID: <20230712101445.bci4qkcf33wkr66d@pengutronix.de>
References: <20230712081258.29254-1-frank.li@vivo.com>
 <20230712081258.29254-6-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzvs6qosiovvxhrt"
Content-Disposition: inline
In-Reply-To: <20230712081258.29254-6-frank.li@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_031502_157749_144C110F 
X-CRM114-Status: GOOD (  16.87  )
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


--bzvs6qosiovvxhrt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 04:12:37PM +0800, Yangtao Li wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

While I like like you picking up the quest of converting drivers, I'd
like to have some coordination in place to not let us do duplicate work.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bzvs6qosiovvxhrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSufRQACgkQj4D7WH0S
/k5CGwf+J9LZL39gNGaKLsIHlIqVcOPuaffvlQEbuDPEk+NXzDuFe8zPPMp2Q47i
u53yJb74c9cR03QdbMMAmLI5Z348gpIamQtynQ7gHIwOrHNeY5cLRrdyXhrRVg5z
W7w9/KR+QlKenZogcWWIjoQHS2CHbQ8O4THEYn0SH6YIOfhT19vZtdz5DHSiH0xr
8FiJxXBzBBlpY+oGkLw58t0tkJCKlBj5AtR8LWWt320FiRPBgbGiNzfBvOaSXd5y
DWD+19p5HzYJkaKgtXmGKTOQ4DGS5zCHPxAK43BgNVguwma9ZM7baQjKnfv6AY3T
dZzKa7Yyfq6vuvAxHq4OgAIOyDnYdw==
=8PTH
-----END PGP SIGNATURE-----

--bzvs6qosiovvxhrt--

