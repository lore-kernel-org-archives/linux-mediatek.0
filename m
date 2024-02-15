Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081B7C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGaOR3JrvbNxdzYuljKQSDyegZUnjscSEhTYS3fW2Xc=; b=oEGwqNSBcDGpzgs7Ev3RrayHv3
	TwEQwJXV626tXJokfZA8tEbGsLbKbwxinfovxkUDiNQIFq8uP+Z6PjpXktiJVlW62fdcNWc9wYzbX
	xy9Z6dVn0b1M+1dIBvqH/MngeDBFTRzH6z0EM+15fyjCaWBkKqNWqlarqYB7PfzVsHOFeQz7ql0Jf
	wvLaSJzrGLKLzY+PsoEPLkg7OncDbbFScskbnGaTMj8a/sGDlxVT318LBp4eYkimWVk1vsPXzi5N3
	I0a15QDS6hxERWkkwPje6CDvoo+f3ikcl14mlp/Yy+6yI/vfZfqLbize51xto81qLFO2R3dpe6jfz
	P2asE98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raa0q-0000000G43J-3aUm;
	Thu, 15 Feb 2024 11:34:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raa0o-0000000G42F-1ent
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Feb 2024 11:34:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raa0W-0006Oi-9q; Thu, 15 Feb 2024 12:34:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raa0V-000sFI-FZ; Thu, 15 Feb 2024 12:34:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raa0V-005JyK-1D;
	Thu, 15 Feb 2024 12:34:23 +0100
Date: Thu, 15 Feb 2024 12:34:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
Message-ID: <ive5ueu7oq4hdfzxjevalssaotfmq2jb47zxanwbscxdaldum2@3bpqogbuhbjs>
References: <20240214140454.6438-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75b4mriap2dmrhji"
Content-Disposition: inline
In-Reply-To: <20240214140454.6438-1-zajec5@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_033442_446907_3BB25AE6 
X-CRM114-Status: GOOD (  13.74  )
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


--75b4mriap2dmrhji
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 14, 2024 at 03:04:53PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> MT7988 has on-SoC controller that can control up to 8 PWM interfaces. It
> differs from blocks on other SoCs (amount of PWMs & registers) so it
> needs its own compatible string.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> V2: Explain new compatibility string reason in commit body
>=20
>  Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied both patches to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Best regards and thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--75b4mriap2dmrhji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXN9rgACgkQj4D7WH0S
/k78SQgAhCV+r9LL9m8V3LBBqRSGqQoucfaii47kWo/cOi+uyoYCscPQQqP+1amS
Nx8xPfxWcgPdrCoDuTIbBIgXcxaO33UqAhkVRQp+Hq9+u9ybN25CivUMQboc95gO
3dzq6TTAjeXI44ydVhrVWwkMiYT4dpHGXkbNgKljSip6VPVZGNNccTVpxVA8ej5D
3tAXnIjt7bPcowTywTq/EJL6xp1DdMpDkxVltcYG2jIL8oYy8FnfTsR2jnq6hPYX
9RM9T32SoNZ+7aY+xGkG8p74AhZRPT2ctQeCwbRkHJNh1dYzlsVQqI+ZZgxCvyGL
OJuORiHGhavkt84HtDj/x53M7jbMHw==
=I2g8
-----END PGP SIGNATURE-----

--75b4mriap2dmrhji--

