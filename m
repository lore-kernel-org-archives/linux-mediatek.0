Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2089C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYx9I4JQliTcz+uWTevQOPSnSbzMqa0z3W8dpMW/YSE=; b=3AOdSTLNVSzY0iAHvMRJWXjQjf
	BwaaoDW1NP3dPVX3mq1HptTKirCFzP+L9Z49iqzPVBbk+eb88+aOSVv5Pmn+JIwne3gHr/lGOFExI
	GpAR9eFDesAZo5J2D7eeEqIYTYxhU9rMWYxuqfWpwRTd6o5yRVmXo/Tyjl9e9hVTORqA0MCeSpOoQ
	bxJTA+A0UOJsect4Yj61x3HUovzw1LyjyATTEbwXxNC7OnyZzQ4UDZb6RxFV9DqqKkkFg2NYXl1gX
	emgeIN/j2FzVXpBE80thgO7wuxCIjnIiJlvg2NN3WMGvFznLbtv9SdJnx257ZbotVfwpDDZz5kSKc
	V3aWkPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noWMU-003wTY-Bx; Tue, 10 May 2022 20:21:38 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noWMR-003wRi-4S
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 20:21:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1noWM9-00045f-Qa; Tue, 10 May 2022 22:21:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1noWM9-001YX0-QC; Tue, 10 May 2022 22:21:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1noWM7-008sln-PZ; Tue, 10 May 2022 22:21:15 +0200
Date: Tue, 10 May 2022 22:21:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
Subject: Re: [PATCH 1/2] pwm: pwm-mediatek: Add support for MediaTek Helio
 X10 MT6795
Message-ID: <20220510202111.lbdtqr3i6i3m4hmb@pengutronix.de>
References: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
 <20220503105405.54832-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220503105405.54832-2-angelogioacchino.delregno@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_132135_222333_B830FDA8 
X-CRM114-Status: GOOD (  11.35  )
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
Content-Type: multipart/mixed; boundary="===============9173963151861551024=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9173963151861551024==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wdtfek4vpxlvgeau"
Content-Disposition: inline


--wdtfek4vpxlvgeau
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2022 at 12:54:04PM +0200, AngeloGioacchino Del Regno wrote:
> The MediaTek Helio X10 MT6795 SoC has 7 PWMs: add a compatible string
> to use the right match data.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

LGTM

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wdtfek4vpxlvgeau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJ6yTQACgkQwfwUeK3K
7AnFkgf8CEb9HpPafjms8PISGpb1A+Q2khebLOLn50vUSlGgw0nQa+4pZESMHZyC
h0hs5fyOboYaGCZ5Lbl2+u9weIDwOo8kWR4juafflr+yrSUmU7/SvUm6whOhwKyM
4WGSasaDyyaI5Tu5V4AxjG9Uktc7l3LKdG6RsbXmh+pxsYR84faCAztr8fsJ8CnV
YBJLqFDts+Zv8xO77mQY+b2v6v9cmee6iDc7hNQl9Lcxd2iZ/xsJu89Polf+B6bx
iChumB+l6opA0uI0qWXBA7/AfZPDg4tGVG824HdpzSGranGnVRVZqWq6a1BY+jtd
khpkFUchFBNgTRsi7ey7QPBwFLq4gg==
=UxND
-----END PGP SIGNATURE-----

--wdtfek4vpxlvgeau--


--===============9173963151861551024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9173963151861551024==--

