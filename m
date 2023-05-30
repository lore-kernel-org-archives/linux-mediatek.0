Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E2C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMAkvSCqbC4J4nbn/6Jk9yqt6+Ft70J5IlyTQPhHIPE=; b=EUzirFWkPVDV7lwpWr4XrQ2P63
	Mro3Blk86qmgPxuZI0UcE8WW1PZ4z26iKIbmCNOy0jPxz11pRyv2+BxcnhDhD/R47P/8JoXmxvqgV
	F60TaaQZMZeqPDWJ/F3vyAivuxK4WU/VH3FKRx1aTwvsRGWJ9UaFa0CQ+8ev5vcWb8VvP4KyfEq4T
	WF/QqH8qy3Zp0lIQezSqQ5YSYoJdvORxWz9EZeUVDDwfP4rS7eyljhFc1qY5umMRxG00ftq1t0aw4
	9mUbonOgmLfUET3ZlkZYz8z/VeWklbB3Ist7/qgJ7Mmpy9BdNBwNnNKo+gwQZIOzIXWUm7UFUFE2y
	RXenendw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zWi-00E45L-0g;
	Tue, 30 May 2023 13:36:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zWe-00E43u-2t
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 13:36:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3zWV-0007td-W5; Tue, 30 May 2023 15:36:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3zWV-003t9S-0a; Tue, 30 May 2023 15:36:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3zWU-009W3q-Cp; Tue, 30 May 2023 15:36:26 +0200
Date: Tue, 30 May 2023 15:36:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi: mt65xx: Properly handle failures in .remove()
Message-ID: <20230530133623.w5icilpjef22d4ks@pengutronix.de>
References: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
 <20230530081648.2199419-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwoxo3tg2d22j34r"
Content-Disposition: inline
In-Reply-To: <20230530081648.2199419-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_063636_962091_92E5A81C 
X-CRM114-Status: GOOD (  21.34  )
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


--bwoxo3tg2d22j34r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, May 30, 2023 at 10:16:46AM +0200, Uwe Kleine-K=F6nig wrote:
> Returning an error code in a platform driver's remove function is wrong
> most of the time and there is an effort to make the callback return
> void. To prepare this rework the function not to exit early.
>=20
> There wasn't a real problem because if pm runtime resume failed the only
> step missing was pm_runtime_disable() which isn't an issue.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I just noticed there is a patch in next that conflicts with that one. My
merge resolution looks as follows:


diff --cc drivers/spi/spi-mt65xx.c
index 17162c8661b4,9333a0e8204d..000000000000
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@@ -1276,18 -1275,21 +1276,24 @@@ static int mtk_spi_remove(struct platfo
  	struct mtk_spi *mdata =3D spi_master_get_devdata(master);
  	int ret;
 =20
 +	if (mdata->use_spimem && !completion_done(&mdata->spimem_done))
 +		complete(&mdata->spimem_done);
 +
- 	ret =3D pm_runtime_resume_and_get(&pdev->dev);
- 	if (ret < 0)
- 		return ret;
+ 	ret =3D pm_runtime_get_sync(&pdev->dev);
+ 	if (ret < 0) {
+ 		dev_warn(&pdev->dev, "Failed to resume hardware (%pe)\n", ERR_PTR(ret));
+ 	} else {
+ 		/*
+ 		 * If pm runtime resume failed, clks are disabled and
+ 		 * unprepared. So don't access the hardware and skip clk
+ 		 * unpreparing.
+ 		 */
+ 		mtk_spi_reset(mdata);
 =20
- 	mtk_spi_reset(mdata);
-=20
- 	if (mdata->dev_comp->no_need_unprepare) {
- 		clk_unprepare(mdata->spi_clk);
- 		clk_unprepare(mdata->spi_hclk);
+ 		if (mdata->dev_comp->no_need_unprepare) {
+ 			clk_unprepare(mdata->spi_clk);
+ 			clk_unprepare(mdata->spi_hclk);
+ 		}
  	}
 =20
  	pm_runtime_put_noidle(&pdev->dev);

If it's too complicated to apply, I can resend a rebased version.
After that the other two patches apply just fine.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bwoxo3tg2d22j34r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR1+9YACgkQj4D7WH0S
/k4xswgAqR9LBvO5+sHk8YAxf68ZmSMUmt0HsbjXSpNc75gb9KXMn9Rw6NEobbAH
ZOQJT0KxdchxeApsGJCHs4RCL7GsNemNmcmovVyUhXEUjn+UB9+AX9W4twqLTL8v
qAypJ5WOHUhJT00kF0TDYSuYUeU/US7niuIYdE7B+PD/b8wWp0AI/8x5ZqlrayPn
HBTPuB8310FaLtD5D4AfWZ4KuqX6Swl6UBC98hsGEU6oMgNKME5y3SR6FN0SB7/T
P9eyIAP85vd6R7IzQhcquiLhZ/MlnQCjNLviA1jHfEtBxhAs5hP+Qd6FNmmsL4O4
/a1uq+ITwM9y9dXbps7YQ05jAZWCrQ==
=L/Gt
-----END PGP SIGNATURE-----

--bwoxo3tg2d22j34r--

