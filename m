Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A99C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=On9XRR7qyUCaqv1OIb0cjWQ9JiPc06NOF729i0gsCA8=; b=3fbag8XWJFsROrDLMDYdFqRZ24
	DSmI/W+kWVfw3gX7+SsjyqWpwZfohJPL4GiSGzRgI42xKZaX0G9rxFDPHsB1kc85jrNBjOxUT2MKv
	u+0+SrvrHLvZjJtpD9Kt+pmwbbxW3/Yr2/koYQ/+DItkBRpqegqWhJ7PLI6x5Z0zOgGCLV3t9/RuW
	f+IK4CnFSoDGA/PudskgRwRb7yWBH22S+2E+WHATqchSWI0NlCEPY4MfjXiWqFIdTmL0TeFTPijnU
	c5d1o/5ElHWJ9BzedgT1hFCcfvHS2z5MRp0M8MgFontJKJnNnKDNres//p9U/DM+DoflY35hrdu2E
	lHzuKEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1ou-00B2vl-0Z; Tue, 31 May 2022 13:22:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1oA-00B2YJ-1Z
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 13:21:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw1nx-0000Ep-Gx; Tue, 31 May 2022 15:21:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw1nx-005efL-QH; Tue, 31 May 2022 15:21:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw1nv-00DJc8-Q8; Tue, 31 May 2022 15:20:59 +0200
Date: Tue, 31 May 2022 15:20:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabien Parent <fparent@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: add MT8365 SoC binding
Message-ID: <20220531132059.xjskzckbfs7ryuky@pengutronix.de>
References: <20220530205038.917431-1-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220530205038.917431-1-fparent@baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_062114_175174_574C975C 
X-CRM114-Status: GOOD (  13.97  )
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
Content-Type: multipart/mixed; boundary="===============3461205256498546493=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3461205256498546493==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tynsucpudxxdmjic"
Content-Disposition: inline


--tynsucpudxxdmjic
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 10:50:37PM +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2: fix clock description (five -> three)

LGTM:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

If you want to further improve: This binding document wants to be
converted to yaml.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tynsucpudxxdmjic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKWFjgACgkQwfwUeK3K
7AlCRwf/VVvjLyJHg3Nxfrv26HKBGmX+EYRGK2t4VxMlx6ga7dudvL1daRdztnuI
7tywCMIgWpT6P7Mh8hKOYQldUSX+q9JzYncZ5DZXamBmnP8SfUNh5tPTEP8jlZyD
93nHm7eXlqksJF5SL9TPQLxHlWRnVGtsOzz51fzid0W/qz4VLF8LhY3iupFKWjkr
BYfQapf2ZXMWcNphZugIjXspoDTUBMUZRk8++o+5Zu0be++MAdyGU5OgBqLf6CrA
PmdtB/AjJYDRZA5duAD++rAdceOW7sTrnuepZVw1krcOxEOnb23SlD0NVXfwTIC6
ZG4NLDFRbTKj2/HMI2ibILqMkBtx0Q==
=kAWl
-----END PGP SIGNATURE-----

--tynsucpudxxdmjic--


--===============3461205256498546493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3461205256498546493==--

